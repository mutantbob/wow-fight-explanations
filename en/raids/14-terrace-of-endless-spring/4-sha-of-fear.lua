-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="SAY"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficulty()
  c="RAID"
end
EJ_SetDifficulty(d)


local EerieSkull = GSL(6094)
local OminousCackle = GSL(6095)
local TheOuterShrines = GSL(6089)
local ShaGlobe = GSL(6633)
local PureLight = GSL(6091)
local TerrorSpawn = GSL(6088)
local WallOfLight = GSL(6092)
local BreathOfFear = GSL(6093)


SendChatMessage("DPS and heals spread out to minimize "..EerieSkull.." damage.", c)
SendChatMessage(OminousCackle.." will take the current tank and several others to "..TheOuterShrines.." where they must kill an add.  Eat the "..ShaGlobe.." before the add", c)
SendChatMessage("can absorb it and heal.  Once the add is defeated click the portal to return to the main fight.  Tank must re-stack in the "..PureLight.." before the other tank gets sent away.", c)
SendChatMessage("DPS Blast "..TerrorSpawn.."s from behind, but remember to get back in "..WallOfLight.." before "..BreathOfFear..".", c)
SendChatMessage("Both tanks stack in "..PureLight.." to create a "..WallOfLight.." protecting the raid from "..BreathOfFear.."; ", c)
SendChatMessage("and be ready for "..OminousCackle..".", c)
