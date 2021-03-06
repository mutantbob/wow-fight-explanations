-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Mogu'shan Vaults/Stone Guard

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


local RendFlesh = GSL(6528)
local AmethystPool = GSL(5692)
local CobaltMine = GSL(5772)
local CobaltPetrification = GSL(5776)
local JasperChains = GSL(5778)
local JasperPetrification = GSL(5784)


SendChatMessage("Healers, don't let tanks die to "..RendFlesh..".", c)
SendChatMessage("Ranged, hang out on the carpet.  Nobody stand in "..AmethystPool..".", c)
SendChatMessage("Get out of "..CobaltMine.." unless you are protected by "..CobaltPetrification..".", c)
SendChatMessage("If you get "..JasperChains.." stack with the other fellow.  If "..JasperPetrification.." is up, you can spread out to break the chains with reduced damage.", c)
