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

local Hatchlings = GSL(7350)
local Fledglings = GSL(7351)
local Juveniles = GSL(7607)
local TalonRake = GSL(7364)
local DaedalianWings = GSL(7359)
local DownDraft = GSL(7370)



SendChatMessage("Tanks take turns so "..TalonRake.." can fall off.", c)
SendChatMessage("Try not to get blown off the platform during "..DownDraft..".  Your wings can make you immune to it.", c)
SendChatMessage("Nest team look for the red column of light (high or low).  Kill the "..Hatchlings.." in the nest before they can become "..Fledglings.." and "..Juveniles..".", c)
SendChatMessage("After clearing a nest, step in the red feather to gain "..DaedalianWings..".  If the nest team fails, we will all die.", c)


