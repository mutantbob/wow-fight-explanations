-- Copyright (c) 2014 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=fill mail

function print (msg)
    DEFAULT_CHAT_FRAME:AddMessage(
        msg ,
        
    1,0.7,0.5)
    
end

function extractName(link)
    
    local b = string.find(link, "|h%[")
    local xx = strsub(link, b+3)
    
    local e = string.find( xx, "]|")
    
    return strsub(xx, 1,e-1)
end

function sendMore(itemName)
    for b = 0,4  do
        n = GetContainerNumSlots(b)
        --    print(n)
        for s = 1,n do
            texture, itemCount, locked, quality, readable, x,link,z = GetContainerItemInfo(b, s)
            
            if ( not locked ) and nil ~= itemCount and 0 < itemCount then
                local name = extractName(link)
                if (name==target[1]) then
                    print ( b.."."..s.." : "..name.."  x"..itemCount )
                    UseContainerItem(b, s)
                end
            end 
        end
    end
end


target = {nil}
--print ("bacon")
for i = 1,12 do
    candidate = {}
    a,b,c,d,e = GetSendMailItem(i) 
    candidate={GetSendMailItem(i)}
    --    print ( a..table.getn(candidate) )
    if nil ~= candidate[1] then
        print ("baco")
        print ("x"..candidate[1].."x"..i)
        target = candidate
    end
end

if (nil == target[1]) then
    print ("put something in the mail")
else
    
    print ("eggs")
    print(target[1].."  x"..target[3])
    
    sendMore(target[1])
end
