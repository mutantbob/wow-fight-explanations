-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Heart of Fear/Garalon


function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="SAY"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficultyID()
  c="RAID"
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
  c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)


local Crush = GSL(6266)
local WeakPoint = GSL(6271)
local BrokenLeg = GSL(6272)
local Pheremones = GSL(6267)
local FuriousSwipe = GSL(6122)
local Fury = GSL(6265)
local Pungency = GSL(6268)
local PheremoneTrail = GSL(6269)


SendChatMessage("Stay out of the purple circle or you will trigger "..Crush..", doing heavy damage to the whole raid.", c)
SendChatMessage("Target a leg and get in the blue dashed circle to exploit "..WeakPoint.." while you blast it to cause "..BrokenLeg..".  Once all legs are broken, DPS the body.", c)
SendChatMessage("If you get "..Pheremones.." run to the tanks and pass it to them.  Everyone stay out of "..PheremoneTrail..".", c)
SendChatMessage("Tanks use "..Pheremones.." to kite the boss around the arena.  Make sure at least two people are in the "..FuriousSwipe.." cone, or he gets a stack of "..Fury..".", c)
SendChatMessage("Tanks trade "..Pheremones.." periodically to prevent "..Pungency.." from stacking too high.  In normal mode every Pheremone swap triggers a "..Crush..".", c)
