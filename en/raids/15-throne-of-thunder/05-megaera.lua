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

local Rampage = GSL(7807)
local Cinders = GSL(7000)
local AcidRain = GSL(7011)

SendChatMessage("Tanks, point the head breath weapons away from the raid and the other tank.  Left head left, right head right.", c)
SendChatMessage("Dodge "..AcidRain..".  If you get "..Cinders.." run out of the raid so the dispel creates fire in a safe place.", c)
SendChatMessage("During "..Rampage.." raid stack for heals.  Tanks move into position to tank the new pair of heads.", c)
SendChatMessage("Head kill order is Green, Red, Green, Red, Green, Red...  Don't touch Blue.", c)


