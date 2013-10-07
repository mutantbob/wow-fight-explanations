-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Jin'rokh


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


local Implosion = GSL(7744)
local StaticWound = GSL(7739)
local FocusedLightning = GSL(7741)
local ConductiveWater = GSL(7822)
local LightningFissure = GSL(7743)
local Fluidity = GSL(7735)
local LightningStorm = GSL(7748)
local ElectrifiedWaters = GSL(7737)

SendChatMessage("Whenever the boss applies "..StaticWound.." to the tank, the other tank should take over immediately, even if they have a few stacks left.", c);
SendChatMessage("Kite the "..FocusedLightning.." to a grate and don't let it explode in "..ConductiveWater..".", c);
SendChatMessage("Under no circumstances let it touch a "..LightningFissure.." or the raid will be wiped by "..Implosion, c);

SendChatMessage("Stand in "..ConductiveWater.." to get "..Fluidity..", but get out when "..LightningStorm.." converts it to "..ElectrifiedWaters..".", c)

