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

lfr = ( d==5 )

EJ_SetDifficulty(d)

-- end regularHeader.lua

-- ACmenu=raids/Siege of Orgrimmar/Thok the Bloodthirsty

FearsomeRoar = GSL(7962)
TailLash = GSL(7964)
IcyBlood = GSL(7979)
Bloodied = GSL(7967)
Phase2 = GSL(7961)
BloodFrenzy = GSL(7981)
Jailer = GSL(7968)
PrisonersOfWar = GSL(7969)
Akolik = GSL(8283)
Goral = GSL(8284)
Montak = GSL(8285)

SendChatMessage("Tank swap on "..FearsomeRoar.." and its variations.  Only tanks should be in front.", c)
SendChatMessage("Don't be behind him during "..TailLash..".  Smash any "..IcyBlood.." tombs.", c)
SendChatMessage("Stacking "..Bloodied.." players triggers "..Phase2..".", c)
SendChatMessage("Do not be in front of the boss during Stage 2 or "..BloodFrenzy.." will KILL YOU!", c)
SendChatMessage("Kill the "..Jailer.." and use his key to free a "..PrisonersOfWar..".  Order is "..Akolik..", "..Goral..", "..Montak..".", c)
