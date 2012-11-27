-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end
EJ_SetDifficulty(1) -- 10 normal


local Qiang = GSL(5841)
local MassiveAttacks = GSL(5843)
local Annihilate = GSL(5844)
local FlankingOrders = GSL(5842)
local MaddeningShout = GSL(5836)
local Pestilence = GetSpellLink(50842)
local Subetai = GSL(5846)
local PinningArrow = GSL(5861)
local Volley = GSL(5849)
local Pillage = GSL(5847)
local Zian = GSL(5852)
local UndyingShadow = GSL(5854)
local CoalescingShadows = GSL(5855)


local c="raid"


CHAT(c, "At the pull and as long as "..Qiang.." is active stack on the tank, or "..MassiveAttacks.." will destroy him.")
CHAT(c, "Run out of "..Annihilate.." and re-stack on the tank.  Dodge "..FlankingOrders.." and re-stack on the tank.")
CHAT(c, "For "..MaddeningShout.." stack up and do non-DoT AoE.  Do not DoT your fellow players or "..Pestilence..".")
CHAT(c, "Spread out for "..Subetai.." so that fewer people get "..PinningArrow..".")
CHAT(c, "Dodge "..Volley.." and run away from "..Pillage..".")
CHAT(c, "For "..Zian.." if you are the target of "..UndyingShadow..", get clear of the raid while everyone blasts it down.")
