-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Tortos

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

local DrainTheWeak = GSL(7141)
local KickShell = GSL(7826)
local FuriousStoneBreath = GSL(7135)
local WhirlTurtle = GSL(7129)
local VampiricCaveBat = GSL(7140)
local Rockfall = GSL(7137)

SendChatMessage("Misdirect "..VampiricCaveBat.." to the bat tank before they scatter and eat healers.", c)
SendChatMessage("Keep the bat tank topped off or "..DrainTheWeak.." will heal the bats.", c)
SendChatMessage("Do not "..KickShell.." until it is needed to interrupt "..FuriousStoneBreath..".", c)
SendChatMessage("Dodge "..Rockfall..".  Priority is 1 "..WhirlTurtle.." > "..VampiricCaveBat.." > extra turtles", c)
