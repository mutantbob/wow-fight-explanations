-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Dark Animus

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


local AccelerationLink = GSL(7765)
local Evasive = GSL(7860)
local CrimsonWake = GSL(7768)
local MatterSwap = GSL(7761)
local AnimaRing = GSL(7127)
local AnimaFont = GSL(7767)
local FULL_POWER = GSL(7773)


SendChatMessage("Separate the golems to prevent "..AccelerationLink.." and "..Evasive..".", c)
SendChatMessage("Kite the "..CrimsonWake.." and don't drag it through the raid.", c)
SendChatMessage("Dispel "..MatterSwap.." as soon as the players are healthy enough to survive the damage.", c)
SendChatMessage("Escape from the "..AnimaRing.." before it blows you up.", c)
SendChatMessage("If you have "..AnimaFont..", stand away from other players.", c)
SendChatMessage("Kill the boss before he drains all the golems and reaches "..FULL_POWER..".", c)
