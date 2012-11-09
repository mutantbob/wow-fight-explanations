-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="s"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficulty()
  c="raid"
end
EJ_SetDifficulty(d)


local DevastatingCombo = GSL(5672)
local Stomp = GSL(5729)
local Strength = GSL(5677)
local Courage = GSL(5676)
local TitanGas = GSL(5670)

CHAT(c, "Tanks separate the bosses so that their "..DevastatingCombo.." does not overlap.")
CHAT(c, "Adds are a priority.  If they accumulate healers will be overwhelmed.")
CHAT(c, "DPS, let the tanks get aggro on "..Strength.." before blasting it.  Attack "..Courage.." from behind to kill it before it reaches a tank.")
CHAT(c, "Get out of the way of "..DevastatingCombo..".  The "..Stomp.." has a 12-yard range.  The others are 25-yard.")
CHAT(c, "During "..TitanGas.." use defensive cooldowns.  Powerful raid-wide healing is required.")
