-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 3;
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

-- ACmenu=raids/Siege of Orgrimmar/Paragons of the Klaxxi


Kilruk = GSL(8004)
Gouge = GSL(8006)
Mutilate = GSL(8007)
Korven = GSL(8011)
ShieldBash = GSL(8053)
ViciousAssault = GSL(8054)
Kaztik = GSL(8010)
SonicProjection = GSL(8051)
FieryEdge = GSL(8057)
Bloods = GSL(8062)
Skeer = GSL(8014)
EncaseInAmber = GSL(8052)
YellowPools = GSL(8039)

SendChatMessage("Tank swap "..Kilruk.." for "..Gouge.."/"..Mutilate.." combo.  ", c)
SendChatMessage("Tank swap "..Korven.." for "..ShieldBash.."/"..ViciousAssault.." combo.", c)
SendChatMessage("Get out of "..YellowPools..".", c)
SendChatMessage("Point "..Kaztik.."'s "..SonicProjection.." away from the raid.", c)
SendChatMessage("Don't stand in the "..FieryEdge.." lasers and separate to reduce damage.", c)
SendChatMessage("Kill the "..Bloods.." before they can heal "..Skeer..".", c)
SendChatMessage("During "..Korven.." blast the "..EncaseInAmber.." or the encased boss will heal.  Failure to do this can drag out the fight until the healers run OOM.", c)
