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

-- ACmenu=raids/Highmaul/Kargath Bladefist

Impale = GSL(9383)
BladeDance =GSL(9384)
BerserkerRush = GSL(9385)
ChainHurl = GSL(9386)
DrunkenBileslinger = GSL(9387)
IronBomber = GSL(9390)
IronGrunt = GSL(9393)
FirePillar = GSL(9394)
RavenousBloodmaw = GSL(9396)

if (not lfr) then
   SendChatMessage("Do not fall into the "..RavenousBloodmaw.." pit.", c)
end
SendChatMessage("Everyone spread out 7 yards for the continual "..BladeDance..". /range 7", c)
SendChatMessage("Tank swap on "..ChainHurl..".  Spend a cooldown to mitigate "..Impale.." damage, especially the after you have one stack.", c)
SendChatMessage("Upon "..ChainHurl.." we want the tank with the most recent Impale, a healer, and 3 DPS to stand close to the boss and be thrown into the stands.", c)
SendChatMessage("While in the stands kill "..IronBomber.."s and "..DrunkenBileslinger.."s, the "..IronGrunt.."s are of little concern.", c)
SendChatMessage("If you are the target of "..BerserkerRush.." kite Kargath into a "..FirePillar..".", c)

