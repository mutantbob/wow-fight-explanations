-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Iron Qon

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

local ThrowSpear = GSL(6875)
local UnleashedFlame = GSL(6870)
local MoltenOverload = GSL(6973)
local ArcingLightning = GSL(6876)
local DeadZone = GSL(6914)
local Freeze = GSL(6915)
local FreezeCyclone = GSL(6920)
local Windstorm = GSL(6877)

if 5==d then
   UnleashedFlame = GSL(6974)
end

SendChatMessage("Occasionally cluster 3 people to trigger "..UnleashedFlame.." and prevent "..MoltenOverload..".",c)
SendChatMessage("Dodge "..ThrowSpear..".  Run out of "..Windstorm.." and group up at the entrance.",c)
SendChatMessage("Top off the raid before "..Freeze.." shatters.  Never get caught by a "..FreezeCyclone..".",c)
SendChatMessage(""..DeadZone.." make the boss immune from the protected sides.  Attack from an unshielded side.",c)
SendChatMessage("Click the unhealable "..ArcingLightning.." victim to rescue them before they die.",c)
