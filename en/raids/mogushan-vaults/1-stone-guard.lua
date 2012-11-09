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


local RendFlesh = GSL(6528)
local AmethystPool = GSL(5692)
local CobaltMine = GSL(5772)
local CobaltPetrification = GSL(5776)
local JasperChains = GSL(5778)
local JasperPetrification = GSL(5784)


CHAT(c, "Healers, don't let tanks die to "..RendFlesh..".")
CHAT(c, "Ranged, hang out on the carpet.  Nobody stand in "..AmethystPool..".")
CHAT(c, "Get out of "..CobaltMine.." unless you are protected by "..CobaltPetrification..".")
CHAT(c, "If you get "..JasperChains.." stack with the other fellow.  If "..JasperPetrification.." is up, you can spread out to break the chains with reduced damage.")
