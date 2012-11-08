-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/


function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end
EJ_SetDifficulty(1) -- 10 normal


local Crush = GSL(6266)
local WeakPoint = GSL(6271)
local BrokenLeg = GSL(6272)
local Pheremones = GSL(6267)
local FuriousSwipe = GSL(6122)
local Fury = GSL(6265)
local Pungency = GSL(6268)
local PheremoneTrail = GSL(6269)


local c="raid"


CHAT(c, "Stay out of the purple circle or you will trigger "..Crush..", doing heavy damage to the whole raid.")
CHAT(c, "Target a leg and get in the blue dashed circle to exploit "..WeakPoint.." while you blast it to cause "..BrokenLeg..".  Once all legs are broken, DPS the body.")
CHAT(c, "If you get "..Pheremones.." run to the tanks and pass it to them.  Everyone stay out of "..PheremoneTrail..".")
CHAT(c, "Tanks use "..Pheremones.." to kite the boss around the arena.  Make sure at least two people are in the "..FuriousSwipe.." cone, or he gets a stack of "..Fury..".")
CHAT(c, "Tanks trade "..Pheremones.." periodically to prevent "..Pungency.." from stacking too high.  In normal mode every Pheremone swap triggers a "..Crush..".")
