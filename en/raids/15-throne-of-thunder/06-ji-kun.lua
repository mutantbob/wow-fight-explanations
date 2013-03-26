-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Ji-Kun


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

local Hatchlings = GSL(7350)
local Fledglings = GSL(7351)
local Juveniles = GSL(7602)
local TalonRake = GSL(7828)
local DaedalianWings = GSL(7359)
local DownDraft = GSL(7370)



SendChatMessage("Nest team look for the red column of light.  Kill the "..Hatchlings.." in the nest before they can become "..Fledglings.." and "..Juveniles..".", c)
SendChatMessage("Tanks take turns so "..TalonRake.." can fall off.", c)
SendChatMessage("After clearing a nest, step in the red feather to gain "..DaedalianWings..".", c)
SendChatMessage("Try not to get blown off the platform during "..DownDraft..".  Your wings can make you immune to it.", c)


