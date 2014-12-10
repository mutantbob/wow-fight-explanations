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

-- ACmenu=raids/Highmaul/Tectus

EarthenPillar = GSL(10067)
CrystallineBarrage = GSL(10066)
Fracture = GSL(10074)
TectonicUpheaval = GSL(10073)
ShardOfTectus = GSL(10063)
Accretion = GSL(10077)
MoteOfTectus = GSL(10064)
NightTwistedPale = GSL(10815)
EarthenFlechettes = GSL(10070)

Bloodlust = GetSpellLink(71975)

SendChatMessage("Move left/clockwise to get out of "..EarthenPillar..".  If you are the target of "..CrystallineBarrage.." kite right/counterclockwise to keep the poison out of raid.", c)
SendChatMessage("Dodge the "..Fracture..".", c)
SendChatMessage("Second tank pick up "..NightTwistedPale.." and point "..EarthenFlechettes.." away from raid", c)
SendChatMessage("Tectus will only 'die' during "..TectonicUpheaval..".  Tanks pick up 1 "..ShardOfTectus.." each.", c)
SendChatMessage("Focus {skull} shard only.  DoTs on other shard as necessary to keep "..Accretion.." from building up too much.", c)
SendChatMessage("Once the "..MoteOfTectus.." 4-pack spawns, "..Bloodlust.." and focus one at a time.  Do not kill the Shard until all Motes are dead.", c)
