-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Lei Shen

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

local CrashingThunder = GSL(7245)
local Thunderstruck = GSL(7182)
local Decapitate = GSL(7181)
local DiffusionChain = GSL(7239)
local BouncingBolt = GSL(7242)
local DischargedEnergy = GSL(7219)
local Overcharge = GSL(7241)
local StaticShock = GSL(7238)
local BallLightning = GSL(7247)
local LightningWhip = GSL(7220)
local ViolentGaleWinds = GSL(7249)
local FusionSlash = GSL(7195)
local DischargedEnergy = GSL(7179)
local OverwhelmingPower = GSL(7210)

SendChatMessage("Get out of "..CrashingThunder..".  Run away from "..Thunderstruck.." to reduce damage.", c)
SendChatMessage("Spread out for "..DiffusionChain..".  Move into the "..Overcharge.." to avoid the stun.", c)
SendChatMessage("Get into the circle to catch "..BouncingBolt.."s, or you will have to kill the adds.", c)
SendChatMessage("Stack to divide damage from "..StaticShock..".  Spread out for "..BallLightning.." spawn, then stack and AoE.", c)
SendChatMessage("Get out of "..LightningWhip..".  Don't get blown off the platform by "..ViolentGaleWinds..".", c)
SendChatMessage("Tank Lei Shen near a pillar to prevent "..DischargedEnergy..".  Rotate pillars to minimize level-up.  In phase 2 don't get knocked off the platform by "..FusionSlash..".", c)
if  d ~=5 then
   SendChatMessage("For "..Decapitate..": tank swap and victim run away to reduce damage.", c)
   SendChatMessage("Tanks swap for "..Decapitate..", "..FusionSlash..", and "..OverwhelmingPower..".", c)
end
