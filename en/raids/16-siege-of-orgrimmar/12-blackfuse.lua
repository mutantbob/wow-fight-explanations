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

EJ_SetDifficulty(d)

-- end regularHeader.lua

-- ACmenu=raids/Siege of Orgrimmar/Siegecrafter Blackfuse

AutomatedShredder = GSL(8199)
ElectrostaticCharge = GSL(8197)
SerratedSlash = GSL(8196)
ProtectiveFrenzy = GSL(8303)
TransportPipes = GSL(8206)
TheAssemblyLine = GSL(8202)
CrawlerMines = GSL(8212)
LaserTurrets = GSL(8208)
MissileTurrets = GSL(8204)
ShockwaveMissile = GSL(8205)
Superheated = GSL(8209)


SendChatMessage("Tanks swap whenever an "..AutomatedShredder.." joins the fight.  The stacks of "..ElectrostaticCharge.." help kill the shredder.  ", c)
SendChatMessage("Tank the Shredder in the "..SerratedSlash..".  Pop a defensive cooldown to survive "..ProtectiveFrenzy.." when the shredder dies.", c)
SendChatMessage("Use northwest "..TransportPipes.." to get on "..TheAssemblyLine.." and destroy "..CrawlerMines.." before they can be assembled.", c)
SendChatMessage("Dodge the "..ShockwaveMissile.." rings.  Kite the "..Superheated.." away from the raid and don't stand in it.", c)
SendChatMessage("Priority is "..CrawlerMines..".  Raid stand in the northwest to maximize DPS time on the mines.", c)
