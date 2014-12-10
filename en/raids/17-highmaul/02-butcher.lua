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
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
    d = GetRaidDifficultyID()
    c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)

lfr = (d==17)

-- end regularHeader.lua

-- ACmenu=raids/Highmaul/The Butcher

HeavyHanded = GSL(8856)
TheCleaver = GSL(8857)
Cleave = GSL(8859)
BoundingCleave = GSL(8860)
Frenzy = GSL(8862)
Bloodlust = GetSpellLink(71975)

SendChatMessage("Tanks stack because of "..HeavyHanded..".  Tanks swap because of "..TheCleaver..".", c)
SendChatMessage("DPS form 3 tight clumps: 2 in melee for "..Cleave.." and 1 at ranged for "..BoundingCleave..".", c)
SendChatMessage("Cleave managers move in and out to control which melee clump gets "..Cleave.." stacks so we don't reach the instakill threshold.", c)
SendChatMessage("Hold "..Bloodlust.." until the "..Frenzy.." at 30%.", c)


