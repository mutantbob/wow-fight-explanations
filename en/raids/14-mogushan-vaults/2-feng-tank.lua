-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="s"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficulty()
  c="raid"
end
EJ_SetDifficulty(d)



local Epicenter = GSL(5876)
local Barrier
if ( d<3) then
    Barrier = GSL(5882)
else
    Barrier = GSL(6718)
end
local Reversal = GSL(5883)
local LightningLash = GSL(6694)
local LightningFist = GSL(5875)
local FlamingSpear = GSL(5885)
local Wildfire = GSL(5886)
local DrawFlame = GSL(5887)
local ArcaneShock = GSL(6695)
local ArcaneResonance = GSL(5889)
local ArcaneVelocity = GSL(5888)


CHAT(c, "Main tank grab the "..Barrier.." crystal and off tank grab the "..Reversal.." crystal.")
CHAT(c, Reversal.." tank use your macro to steal "..LightningFist..". Later use Fists to interrupt "..Epicenter..".")
CHAT(c, "If the Epicenter can not be interrupted the Barrier tank should protect the raid.")
CHAT(c, "Every time you steal Lightning Fist, taunt off the Barrier tank.  He will taunt back once he loses his "..LightningLash.." stacks and your Reversal cooldown will be back.")
CHAT(c, "Phase 2: use "..Barrier.." to nullify "..DrawFlame..".  You can only do every other one, so arrange to nullify the last one before phase 3.")
CHAT(c, "Tanks take turns to let "..FlamingSpear.." stacks fall off.")
CHAT(c, "Phase 3:  Use barrier to protect the raid from "..ArcaneVelocity..".  Tanks take turns to let the "..ArcaneShock.." stacks fall off.")
