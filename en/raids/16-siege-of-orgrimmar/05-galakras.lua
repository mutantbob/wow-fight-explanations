-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 3;
local c="SAY"
if (IsInGroup(LE_PARTY_CATEGORY_HOME)) then
   if (IsInRaid()) then
      c = "RAID"
      d = GetRaidDifficultyID()
   else
      c = "PARTY"
   end
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
  c="INSTANCE_CHAT"
end

lfr = ( d==5 )

EJ_SetDifficulty(d)

-- end regularHeader.lua

-- ACmenu=raids/Siege of Orgrimmar/Galakras

Totem = GSL(8489)
Shaman = GSL(8431)
Fracture = GSL(8488)
Allies = GSL(8484)
Flamestrike = GSL(8487)
Flagbearer = GSL(8532)
BringHerDown = GSL(8417)
Flames = GSL(8420)

SendChatMessage("Destroy "..Totem.." and interrupt and kill "..Shaman..".  Stun "..Fracture.." before it kills our NPC "..Allies..".  ", c)
SendChatMessage("Destroy banners from "..Flagbearer..". Tank enemies in the friendly "..Flamestrike.." for faster kills.", c)
SendChatMessage("Tower team clear the tower once Demolisher has been killed.  Use the cannon on top to clear trash mobs from the skies.", c)
SendChatMessage("Once we own both towers, players man both cannons and "..BringHerDown..".", c)
SendChatMessage("Stack up.  Kite "..Flames.." through the raid to siphon off its power and weaken its final explosion.", c)
SendChatMessage("Tanks take turns to let the debuff stacks fall off.  Do not stack because it is a cone attack.", c)
