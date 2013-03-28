-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACMenu mail audit


--
-- Scan the DataStore mail database and show when mail will next expire or return
--

function print (msg)
    DEFAULT_CHAT_FRAME:AddMessage(
        msg ,
        
    1,0.7,0.5)
    
end

-- parse the Altoholic DataStore_Mails.lua file and identify stuff that will expire.

function max(a,b)
    if not a or b>a then
        return b
    else
        return a
    end
end

function min(a,b)
    if not a or b<a then
        return b
    else
        return a
    end
end

function computeMailAges(db, character, perServer)
    
    if not db.Mails then
        return nil
    end
    
    if not perServer then
        return nil
    end
    
    local rval = { ["count"] = 0 }
    for q, m in ipairs (db.Mails) do
        rval.count = rval.count + 1
        local expire = db.lastUpdate + 24*60*60*m.daysLeft
        --print ((m.returned and "1" or "nil").."\t"..(m.sender~= character and 1 or 0).."\t"..(perServer[m.sender] or "nil"))
        if (not m.returned and m.sender ~= character and perServer[m.sender]) then
            -- expire  = expire + 30*24*60*60
            
            rval.returning = min(rval.returning, expire)
        else
            rval.expire = min(rval.expire, expire)
        end
    end
    
    return rval
end

--

function doomString(when, now)
    
    if when then
        return string.format("%6.1f", (when - now)/(24.0*60*60))
    else
        return "    _"
    end
end

--

function cmpNumberNilHigh(a,b)
    
    if nil == a then
        if nil == b then
            return 0
        else
            return 1
        end
    else
        if nil == b then
            return -1;
        else
            
            if a < b then
                return -1
            end
            
            if a > b then
                return 1
            end
            
        end
    end
    
end

function cmpExpireName(a,b)
    
    local rval = cmpNumberNilHigh(a.expire, b.expire)
    if 0 ~= rval then return rval end
    
    if a.ssc < b.ssc then
        return -1
    end
    
    if a.ssc > b.ssc then
        return 1
    end
    
    return 0
    
end

--

function insertPos(list, newVal, comparator)
    
    local n = # list
    for i = 1,n do
        if 0>= cmpExpireName(list[i], newVal) then
            return i
        end
    end
    return 1 + #list
end

function insert(list, newVal, comparator)
    local pos = insertPos(list, newVal, comparator)
    table.insert(list, pos, newVal)
end


now = time()

--

perServer = {}

for ssc, db in pairs(DataStore_MailsDB.global.Characters) do
    
    local i = string.gmatch(ssc, "([^.]+)")
    local profile, server, character = i(), i(), i()
    
    if not perServer[server] then
        --print (server)
        perServer[server] = {}
    end
    perServer[server][character] = 1
    
end

report = {}

for ssc, db in pairs(DataStore_MailsDB.global.Characters) do
    
    local i = string.gmatch(ssc, "([^.]+)")
    local profile, server, character = i(), i(), i()
    
    local ages = computeMailAges(db, character, perServer[server]);
    
    if not ages then
        ages = { ["count"] = 0 }
    end
    
    ages["ssc"] = ssc
    ages.character = character
    ages.lastUpdate = db.lastUpdate
    
    insert(report, ages, cmpExpireName)
    
    
end

print("stacks  expire  return  last visit  character")
for idx, ages in pairs(report) do
    
    local character = ages.character
    local death1 = doomString(ages.expire, now)
    local death2 = doomString(ages.returning, now)
    
    pad = string.rep(" ", 20-#character)
    print ( ""
    .. "["..(ages.count).."]"
    .."   "..death1.."   "..death2
    .."   "..doomString(ages.lastUpdate, now)
        .."  "..character --..pad
        
    )
end
