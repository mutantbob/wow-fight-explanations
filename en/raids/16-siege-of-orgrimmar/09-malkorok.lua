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

-- ACmenu=raids/Siege of Orgrimmar/Malkorok

AncientMiasma = GSL(7872)
AncientBarrier = GSL(7873)
ArcingSmash = GSL(7883)
SeismicSlam = GSL(7884)
Breath = GSL(7895)
FatalStrike = GSL(7899)
ImplodingEnergy = GSL(7897)
BloodRage = GSL(7875)
DisplacedEnergy = GSL(7882)

SendChatMessage(AncientMiasma.." turns all heals into "..AncientBarrier..". Healers maintain this shield on the entire raid.", c)
SendChatMessage("Tank swap to let "..FatalStrike.." fall off.", c)
SendChatMessage("Let one person stand in the "..ImplodingEnergy..", or the whole raid gets blasted. ", c)
SendChatMessage("Get out of "..ArcingSmash.." before "..Breath..".  Spread out to minimize "..SeismicSlam.." damage.", c)

SendChatMessage("Healing is possible during "..BloodRage..".", c)
SendChatMessage("Stack to divide "..BloodRage.." damage.  "..DisplacedEnergy.." victims get away from the raid until you explode.", c)
