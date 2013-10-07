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

-- ACmenu=raids/Siege of Orgrimmar/Iron Juggernaut

FlameVents = GSL(8185)
CrawlerMine = GSL(8183)
Laser = GSL(8190)
ExplosiveTar = GSL(8191)
BorerDrill = GSL(8179)

SendChatMessage("Tanks take turns to let "..FlameVents.." fall off.  Do not stack because it is a cone.", c)
SendChatMessage("If you have a defensive cooldown, use it to stomp on "..CrawlerMine.." to protect the raid.  If you don't, pray someone will stomp it for you.", c)
SendChatMessage("Kite the "..Laser.." away from the raid and "..ExplosiveTar..".", c)
SendChatMessage("Dodge the "..BorerDrill.." dust clouds.", c)
