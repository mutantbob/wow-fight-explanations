-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

-- ACmenu=5-mans/generic


function GSL(sid)
    local a={ EJ_GetSectionInfo(sid) }
    return a[9]
end

function  recurseSection(sid)
    local title, description, headerType, abilityIcon, displayInfo, siblingID, nextSectionID, filteredByDifficulty, link, startsOpen, flag1 = EJ_GetSectionInfo(sid)
    msg = ""
    if title == "Damage Dealers" or title == "Healers" or title=="Tanks" then
        msg=msg.." ".. link
    end
    if nextSectionID then
        msg = msg.." "..recurseSection(nextSectionID)
    end
    if siblingID then        
        msg = msg.." "..recurseSection(siblingID)
    end
    return msg
end


local d = 2;
local c="SAY"
if (IsInGroup(LE_PARTY_CATEGORY_HOME)) then
    if (IsInRaid()) then
        c = "RAID"
        d = GetRaidDifficultyID()
    else
        c = "PARTY"
    end
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
    c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)

-- end regularHeader.lua

-- ACmenu=5mans/generic



DD = GSL(10326)
SuppressiveFire = GSL(9736)
SlagBlast = GSL(10323)

eid = EJ_GetCurrentInstance()

if eid<1 then
    eid=1163
end

name, description, encounterID, rootSectionID, link = EJ_GetEncounterInfo(eid)

msg = recurseSection(rootSectionID)

SendChatMessage(link..":"..msg, c)
