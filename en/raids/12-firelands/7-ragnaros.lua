-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Firelands/Ragnaros


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

local LavaWave = GSL(2631)
local MagmaTrap = GSL(2634)
local SonOfFlame = GSL(2637)
local BurningSpeed = GSL(2638)
local MoltenSeed = GSL(2645)
local MoltenInferno = GSL(2646)
local MoltenElemental = GSL(2647)
local LavaScion = GSL(2653)
local LivingMeteor = GSL(2661)

SendChatMessage("Dodge "..LavaWave..".  Don't step in "..MagmaTrap.." unless you can survive a long fall.", c)
SendChatMessage("Blast the "..SonOfFlame.." to half health to cancel "..BurningSpeed..".", c)
SendChatMessage("Spread out a little to avoid double "..MoltenSeed.." damage.  Clear the lane so we have a gathering point safe from "..MoltenInferno..".", c)
SendChatMessage("Clear the lane after all "..MoltenElemental.."s are dead", c)
SendChatMessage("2nd intermission: After all "..SonOfFlame.." are dead, kill "..LavaScion..".", c)
SendChatMessage("Kite "..LivingMeteor..", but not through tanks or healers.  If it's going to catch you, blast it with a ranged attack to make it change targets.", c)
