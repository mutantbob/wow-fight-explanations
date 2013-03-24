-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/


function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="SAY"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficultyID()-2
  c="RAID"
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
  c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)

local Rampage = GSL(7802)

SendChatMessage("Tanks, point the head breath weapons away from the raid and the other tank.  Left head left, right head right.", c)
SendChatMessage("During "..Rampage.." raid stack for heals.  Tanks move into position to tank the new pair of heads.", c)
SendChatMessage("Head kill order is Green, Red, Green, Red, Green, Red...  Don't touch Blue.", c)


