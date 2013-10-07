-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Dark Animus


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


local AccelerationLink = GSL(7765)
local Evasive = GSL(7860)
local CrimsonWake = GSL(7768)
local MatterSwap = GSL(7761)
local AnimaRing = GSL(7127)
local AnimaFont = GSL(7767)
local FULL_POWER = GSL(7773)


if  d ~= 7 then
   SendChatMessage("Separate the golems to prevent "..AccelerationLink.." and "..Evasive..".", c)
end
SendChatMessage("Kite the "..CrimsonWake.." and don't drag it through the raid.", c)
SendChatMessage("Dispel "..MatterSwap.." as soon as the players are healthy enough to survive the damage.", c)
SendChatMessage("If you have "..AnimaFont..", stand away from other players.", c)
if d ~= 7 then
   SendChatMessage("Kill the boss before he drains all the golems and reaches "..FULL_POWER..".", c)
end

SendChatMessage("Escape from the "..AnimaRing.." before it blows you up.  Tank swap!", c)
SendChatMessage("AoE the adds to start, but single-target when they get low.  If you AoE them to death at once, the raid will be wiped by freshly activated adds running wild.", c)
