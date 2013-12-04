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

-- ACmenu=raids/Siege of Orgrimmar/Spoils of Pandaria

PandarenCrates = GSL(8366)
SetToBlow = GSL(8392)
Warcallers = GSL(8365)
Enrage = GSL(8385)
Torment = GSL(8373)
SetToBlow = GSL(8392)

SendChatMessage("Open "..PandarenCrates.." and defeat their guardian spirits for a buff.", c)
SendChatMessage("Smash crates and kill adds until the lever is powered up.", c)
SendChatMessage("Kite "..Warcallers.." when they "..Enrage..".", c)
SendChatMessage("Dispel "..Torment.." and stuff.", c)
SendChatMessage("Drop your "..SetToBlow.." bombs away from the raid.", c)

