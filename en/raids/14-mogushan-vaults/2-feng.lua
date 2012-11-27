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



local Epicenter = GSL(5876)
local Barrier
if ( d<3) then
    Barrier = GSL(5882)
else
    Barrier = GSL(6718)
end
local LightningFist = GSL(5875)
local Wildfire = GSL(5886)
local DrawFlame = GSL(5887)
local ArcaneResonance = GSL(5889)
local ArcaneVelocity = GSL(5888)


SendChatMessage("The farther you are from "..Epicenter.." the less damage you take.  Stack up at a distance to let the "..Barrier.." tank protect you.", c)
SendChatMessage("Be ready to dodge "..LightningFist.." in case the boss launches one at the ranged.", c)
SendChatMessage("Phase 2: When you get "..Wildfire.." move out of the raid so that you don't explode fire patches under your teammates.", c)
SendChatMessage("When Feng does "..DrawFlame.." run out of the way as the patches flow to him.", c)
SendChatMessage("Phase 3: If you get "..ArcaneResonance.." stand clear of your teammates.  During "..ArcaneVelocity.." stack on the boss for", c)
SendChatMessage("reduced damage (and maybe "..Barrier..", c).  Resonance victims should be as close as possible without baking their teammates.")
