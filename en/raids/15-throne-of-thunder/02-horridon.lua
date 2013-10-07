-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Horridon


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

local TriplePuncture = GSL(7078)
local DoubleSwipe = GSL(7079)
local Charge = GSL(7080)
local StoneGaze = GSL(7108)
local Sandtrap = GSL(7110)
local LivingPoison = GSL(7115)
local VenomousEffusion = GSL(7113)
local FrozenOrb = GSL(7121)
local AmaniWarbear = GSL(7106)
local Swipe = GSL(7123)
local LNTotem = GSL(7126)
local Dinomancer = GSL(7086)
local OrbOfControl = GSL(7092)
local WarGod = GSL(7087)

SendChatMessage("Tanks take turns to drop "..TriplePuncture.." stacks.  "..DoubleSwipe.." is a front and tail swipe, so let DPS be at his side.", c)
SendChatMessage(Charge.." victim run close to Horridon and point his "..DoubleSwipe.." away from the raid.", c)
SendChatMessage("Don't let the tank get "..StoneGaze..".  Run out of "..Sandtrap..".", c)
SendChatMessage("Get out of "..LivingPoison..".  Interrupt Venom Priest and kill the "..VenomousEffusion..".", c)
SendChatMessage("Run away from "..FrozenOrb..".", c)
SendChatMessage("Point "..AmaniWarbear.." away from the raid for "..Swipe..".  Run away from "..LNTotem..".", c)
SendChatMessage("Kill the "..Dinomancer.." and activate "..OrbOfControl..".", c)
SendChatMessage("Kill "..WarGod..", then finish Horridon.", c)
