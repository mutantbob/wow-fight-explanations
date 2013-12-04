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

-- ACmenu=raids/Siege of Orgrimmar/Garrosh

GrippingDespair = GSL(8316)
SiegeEngineer = GSL(8298)
IronStar = GSL(8300)
Typhoon = GetSpellLink(97636)
AncestralChainHeal = GSL(8296)
FarseerWolfRiders = GSL(8294)
DesecratedWeapons = GSL(8304)
TouchOfYShaarj = GSL(8311)
Bloodlust = GetSpellLink(71975)
Stage3 = GSL(8319)

SendChatMessage("Tank swap for "..GrippingDespair..".", c)
SendChatMessage("Kill southwest "..SiegeEngineer.." to prevent an "..IronStar.." from rolling over our half of the room.  "..Typhoon.." adds into the other Iron Star if possible.", c)
SendChatMessage("Interrupt "..AncestralChainHeal.." and kill "..FarseerWolfRiders..".", c)
SendChatMessage("Ranged alternate between {square} and {diamond} as "..DesecratedWeapons.."s funk up the place.  Ranged Blast the Desecrated Weapon to shrink the puddle of doom.", c)
SendChatMessage("Blast victims of "..TouchOfYShaarj.." before they can MC the entire raid.", c)
SendChatMessage("Save "..Bloodlust.." for "..Stage3.." when Garrosh mutates and all hell breaks loose.", c)
