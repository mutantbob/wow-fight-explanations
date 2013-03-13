-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Terrace of Endless Spring/Lei Shi



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


local Spray = GSL(6220);
local Hide = GSL(6221);
local GetAway = GSL(6222);
local Protect = GSL(6223);
local AnimatedProtectors = GSL(6224);

SendChatMessage("Tanks do not stack because "..Spray.." is a cleave and it stacks.  You will have to take turns to let it fall off.", c)
SendChatMessage("During "..Hide.." all players AoE until it reveals a splash of water.  All players AoE there until Lei Shi is revealed.  Tanks recenter Lei Shi if possible.  Remember "..Spray..".", c)
SendChatMessage("When Lei Shi channels "..GetAway.." everyone run to the center to avoid damage.  Blast the boss to end the pushback.", c)
SendChatMessage("During "..Protect.." the off-tank should gather up the "..AnimatedProtectors..".  Lei Shi is still "..Spray.."ing his tank, so tank swaps can still be necessary.", c)
