-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="SAY"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficulty()
  c="RAID"
end
EJ_SetDifficulty(d)

local CleansingWaters = GSL(5820)
local WaterBolt = GSL(5819)
local LightningPrison = GSL(5802)
local LightningStorm = GSL(5804)
local CorruptedWaters = GSL(5821)
local Purified = GSL(5822)


SendChatMessage("Kite the boss out of "..CleansingWaters..".", c)
SendChatMessage("Spread out to minimize splash damage from "..WaterBolt..".  Get at least 7 yards away from victims of "..LightningPrison..".", c)
SendChatMessage("Dance from donut to donut to minimize "..LightningStorm.." damage.  Destroy "..CorruptedWaters.." and stand near it to gain "..Purified.." buff.", c)
SendChatMessage("The easiest kill order is Kaolan, Regail, Asani.", c)