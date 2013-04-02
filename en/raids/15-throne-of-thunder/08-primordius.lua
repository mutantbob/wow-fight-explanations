-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Primordius


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


local MalformedBlood = GSL(6948)
local PrimordialStrike = GSL(6947)
local VolatilePool = GSL(7831)
local MutatePrimordius = GSL(7832)
local MutatedAbomination = GSL(7829)
local LivingFluid = GSL(6956)
local MutagenicPool = GSL(6958)
local FullyMutated = GSL(7830)

SendChatMessage("Tanks take turns to let "..MalformedBlood.." stacks fall off.  Only tanks stand in front of Primordius or "..PrimordialStrike.." cone will destroy you.", c)
SendChatMessage("Keep Primordius away from "..VolatilePool.." or he will heal and buff ("..MutatePrimordius..").", c)
SendChatMessage("Primordius is protected by "..MutatedAbomination..".", c)
SendChatMessage("All DPS kill "..LivingFluid.."s and step in their "..MutagenicPool.." to stack a buff.", c)
SendChatMessage("Once you become "..FullyMutated.." avoid pools and start clobbering the boss for full damage.", c)
