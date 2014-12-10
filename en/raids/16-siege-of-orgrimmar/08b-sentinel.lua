-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
    local a={ EJ_GetSectionInfo(sid) }
    return a[9]
end

local d = 17
local c="SAY"
if (IsInGroup(LE_PARTY_CATEGORY_HOME)) then
    if (IsInRaid()) then
        c = "RAID"
        d = GetRaidDifficultyID()
    else
        c = "PARTY"
    end
end
if (IsInRaid()) then
    d = GetRaidDifficultyID()
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
    c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)

-- end regularHeader.lua

-- ACmenu=raids/Siege of Orgrimmar/sentinel

StrengthInNumbers = GetSpellLink(148750)

SendChatMessage("Separate the Iron Sentinels because "..StrengthInNumbers.." stacks.  ", c)
