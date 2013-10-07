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

-- ACmenu=raids/Siege of Orgrimmar/Sha of Pride

Pride = GSL(8255)
Overcome = GSL(8270)
SwellingPride = GSL(8256)
BurstingPride = GSL(8257)
Projection = GSL(8258)
WoundedPride = GSL(8261)
Reflection = GSL(8272)
CorruptedPrison = GSL(8266)
Gift = GSL(8268)
Power = GSL(8269)
Mark = GSL(8260)
Manifestation = GSL(8262)
Unleashed = GSL(8267)

SendChatMessage("Don't get "..Overcome.." with "..Pride..".", c)
SendChatMessage("Spread out immediately after "..SwellingPride.." so you don't die in a stack of "..BurstingPride..".", c)
SendChatMessage("Jump into your "..Projection.." (green arrow in purple circle) to protect the raid.", c)
SendChatMessage("Move away from "..Reflection.." spawns to avoid getting spooged with Pride.  Stack after they finish spawning to AoE.", c)
SendChatMessage("Don't stand near "..CorruptedPrison.." unless you are rescuing the victim.  Stand on orange arc to unlock.", c)
SendChatMessage("Stack "..Gift.." to trigger "..Power..", then dispel "..Mark.." while immune to Pride.", c)
SendChatMessage("Destroy "..Manifestation.." behind the raid", c)
if (d ~= 7) then
   SendChatMessage("Tank swap IMMEDIATELY upon "..WoundedPride..".")
end
SendChatMessage("Hold Bloodlust until "..Unleashed.." (30%)", c)
