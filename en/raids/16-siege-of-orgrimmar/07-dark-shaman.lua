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

-- ACmenu=raids/Siege of Orgrimmar/Dark Shaman

FroststormStrike = GSL(8129)
FoulStream = GSL(8132)
Hurricanes = GSL(8136)
Tornados = GSL(8137)
Boogers = GSL(8139)
AshWall = GSL(8133)
Ashfall = GSL(8141)

SendChatMessage("Tanks trade bosses to let "..FroststormStrike.." fall off.", c)
SendChatMessage("Stay out of "..Tornados.." and "..Hurricanes..".  ", c)
SendChatMessage("Ranged kite and kill the "..Boogers..".  Point "..FoulStream.." away from the raid.", c)
SendChatMessage("Nobody stand near "..AshWall.." or you get meleed to death.  Run out of "..Ashfall..", even if ground elevation hides part of the circle of impending death.", c)
