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

-- ACmenu=raids/Siege of Orgrimmar/Immerseus

CorrosiveBlast = GSL(7988)
ShaBolt=GSL(7985)
SeepingSha=GSL(8000)
Swirl = GSL(7987)
ShaPuddle =GSL(7993)
ShaResidue = GSL(7994)
ContaminatedPuddle = GSL(7995)
PurifiedResidue = GSL(7997)

SendChatMessage("Don't get too close to the boss or "..SeepingSha.." will blast you.", c)
SendChatMessage("Tanks swap on "..CorrosiveBlast..".  Tanks do not stack because it's a cone attack.", c)
SendChatMessage("Spread out to reduce "..ShaBolt.." splash damage.  Dodge "..Swirl.." ground effects.", c)
SendChatMessage("Stand near "..ShaPuddle.." and destroy it for "..ShaResidue.." buff.", c)
SendChatMessage("Stand near "..ContaminatedPuddle.." and heal it for "..PurifiedResidue.." buff.", c)
