-- Copyright (c) 2014 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=to do

function print (msg)
    DEFAULT_CHAT_FRAME:AddMessage(
        msg ,
        
    1,0.7,0.5)
    
end

now = time()

timelessChests = {
       {32971, "Mist-Covered Treasure Chest (floaty)"},
        {32969, "Mist-Covered Treasure Chest (hoppy)"},
        {32956, "Blackguard's Jetsam"},
        {32968, "Rope-Bound Treasure Chest"},
}

questsToHold = {
    
    {33334, "Strong Enough To Survive"},
    {33374, "Path of the MIstwalker"},
}


function doneInstanceAlready(raid, difficulty)
    if not raid then
        return false
    end
    
    rd = raid[difficulty]
    if not rd then
        return false
    end
    
    --  print( now - rd["Expires"])
    return now < rd["Expires"]
    
    
end


-- characters should be a list of  "name - server" strings
function checkDoneInstances(db, characters, instances)
    
    -- print (instances[1][1])
    
    for k,ispec in ipairs(instances) do
        
        iname= ispec[1]
        ix = ispec[2]
        --   print("checking "..iname)
        raid = db["Instances"][iname]
        
        for k,v in pairs(characters) do 
            local key = v[1].." - "..v[2]
            if not doneInstanceAlready(raid[key], ix) then    
                print(key.." should run "..iname)
            end
        end
    end
    
end


function checkCharDoneQ(chardb, questid)
    
    if not chardb then
        print("no character")
        return false
    end
    q = chardb["Quests"]
    if not q then
        return false
    end
    
    x = q[questid]
    if not x then
        return false
    end
    
    --print(questid.." "..(now-x["Expires"]))
    
    return now < x["Expires"]
    
end


function checkCharDoneQ1(char, qid)
    
    local pname, realm = UnitName("player")
    if pname == char[1] then
        return IsQuestFlaggedCompleted(qid)
    else
        local key = char[1].." - "..char[2]
        local chardb = db["Toons"][key]
        return checkCharDoneQ(chardb, qid)
    end
end


function checkCharOnQ(qid, pname, realm)
    
    local x = DataStore_QuestsDB["global"]["Characters"]["Default."..realm.."."..pname]
    
    if false then
        print(qid)
        return x["QuestLinks"][qid] ~= nil
    end
    
    for k,v in pairs( x["QuestLinks"] ) do
        local q2 = tonumber(string.match(v, "Hquest:([0-9]*)"))
        
        if q2==qid then
            return true
        end
        
    end
    return false
end



function checkCharacterDoneQuests(chardb, quests, name)
    for k,qspec in ipairs(quests) do
        if not checkCharDoneQ(chardb, qspec[1]) then
            print( name.." should do "..qspec[2] )
        end 
    end
end

function checkDoneQuests(db, characters, quests)
    for k,v in ipairs(characters) do
        local key = v[1].." - "..v[2]
        pc = db["Toons"][key]
        checkCharacterDoneQuests(pc, quests, key)
    end
end


function checkMyQuests(db)
    
    checkDoneQuests(db, other90s, timelessChests)
    
end

function isMyQuestComplete(qid)
    i=1
    while GetQuestLogTitle(i) do
        local questTitle, level, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i)
        
        if (questID== qid) then
            if isComplete then
                return true
            else
                return false
            end
            
        end
        i=i+1
    end
    return false
end

function messageForQuestProgress(qid, qname)
    i=1
    while GetQuestLogTitle(i) do
        local questTitle, level, group, header, collapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i)
        
        if (not header and questID== qid) then
            if isComplete then
                return ("turn in "..questTitle)
            else
                return nil
            end
            
        end
        
        i=i+1
        
    end
    return "go get "..qname
end


function checkCharacterQuestProgress(chardb, qspec, pname, realm)
    
    if checkCharDoneQ(chardb, qspec[1]) then
        return nil
    end
    
    if checkCharOnQ(qspec[1], pname, realm) then
        return nil
    end
    
    return pname.." should pick up "..qspec[2]
    
end

function diagnoseQuestProgress(qspec, pname)
    
    thisDude, thisRealm = UnitName("player")
    thisRealm = GetRealmName()
    
    local msg
    if (pname == thisDude) then
        local qid = qspec[1]
        if IsQuestFlaggedCompleted(qspec[1]) then
            return
        end
        
        msg = messageForQuestProgress(qid, qspec[2])
    else 
        local combo = pname.." - "..thisRealm
        
        local chardb = db["Toons"][combo]
        msg = checkCharacterQuestProgress(chardb,  qspec , pname, thisRealm)
    end
    
    if (msg) then
        print(msg)
    end
    
end

function meDoOneOf(qids, msg)
    for k,v in ipairs(qids) do
        if IsQuestFlaggedCompleted(v) then
            
            return    
        end
    end
    print(msg)
end

function otherDoOneOf(name, qids, msg)
end

function doOneOf(name, qids, msg)
    
    myName, realm = UnitName("player")
    if (name == myName ) then
        meDoOneOf(qids, msg)
    else
        otherDoOneOf(name, qids, msg)
    end    
    
end


function checkBonusRolls2(char)
    
    local cname = char[1]
    if checkCharDoneQ1(char, 33133 ) then
        --print(cname.." already did warforged seals")
        return
    end
    
    local key = cname.." - "..char[2]
    local chardb = db["Toons"][key]
    local wfs = chardb["currency"][776]
    if wfs["amount"] + 3 <= wfs["totalMax"] then
        print(cname.." do warforged seals")
    else
        -- print(cname.." has too many seals")
    end    
    
end


function checkBonusRolls(chars)
    
    for k,v in pairs(chars) do
        checkBonusRolls2(v)
    end
end


--
--



db = SavedInstancesDB

-- onyxia =     {"Onyxia's Lair", 3}
r1={
    --    onyxia,
    --    {"Ordos", 2},
    --    {"The Four Celestials", 2},
    
}

-- checkDoneInstances(db, {"Igoar - Whisperwind"}, { onyxia} )

other90s = {
    {"Lucrelucia", "Whisperwind"},
    {"Immolatrix", "Whisperwind"},
    {"Darthbarbie", "Whisperwind"},
    {"Abelnightrod", "Whisperwind"},
    {"Fabricia", "Whisperwind"},
    {"Metakleptos", "Whisperwind"},
    {"Toucher", "Whisperwind"}
}

darkmoonChars = {
    "Igoar",
    "Lucrelucia",
    "Immolatrix",
    "Darthbarbie",
    "Abelnightrod",
    "Fabricia",
    "Metakleptos",
    "Toucher",
    "Kawaiiamok",
    "Bambootay",
}


thisDude, thisRealm = UnitName("player")

checkDoneInstances(db,other90s, r1)


checkMyQuests(db)

if False then
    for k,v in ipairs(timelessChests) do
        if not IsQuestFlaggedCompleted(v[1]) then 
            print("do "..v[2])
        end
    end
end

for k,v in ipairs(questsToHold) do
    
    diagnoseQuestProgress(v, thisDude)
end

--doOneOf("Igoar", { 31443, 31444, 31446 }, "Do a rare fish")

if not IsQuestFlaggedCompleted(31752) then
    print("somebody do Blingtron 4000!")
end

for k,v in ipairs( darkmoonChars ) do
    diagnoseQuestProgress({29433, "Test Your Strength"}, v)
end

-- checkBonusRolls(other90s)
--checkBonusRolls({ { "Igoar", "Whisperwind"} })
