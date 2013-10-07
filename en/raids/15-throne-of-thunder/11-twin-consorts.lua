-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Twin Consorts

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


local MoonLotus= GSL(7630)
local CosmicBarrage=GSL(7635)
local Beast = GSL(7634)
local CorruptedHealing = GSL(7635)
local LightOfDay = GSL(7644)
local FlamesOfPassion = GSL(7638)
local FanOfFlames = GSL(7637)
local IceComet = GSL(7649)
local BlazingRadiance = GSL(7646)
local CelestialAid = GSL(7651)
local TidalForce = GSL(7654)

SendChatMessage("Tank swap upon "..Beast.." and only uses the minimum number of biggest heals to minimize "..CorruptedHealing..".",c)
SendChatMessage("Tank swap to let "..FanOfFlames.." stacks fall off.",c)
SendChatMessage("Move Suen onto "..IceComet.." to reduce "..BlazingRadiance.." stacks. Never attack Ice Comet.  "..TidalForce.." makes Lu'lin almost immune.",c)
SendChatMessage("Dodge "..MoonLotus.." clouds.  Spread out for "..CosmicBarrage..", "..LightOfDay..", and "..FlamesOfPassion..".",c)
SendChatMessage("Don't mess with "..CelestialAid.." animal pillars unless you know how to draw the constellations.",c)

