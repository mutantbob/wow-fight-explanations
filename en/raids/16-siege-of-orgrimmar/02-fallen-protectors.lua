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

-- ACmenu=raids/Siege of Orgrimmar/The Fallen Protectors

Rook = GSL(7885)
VengefulStrikes = GSL(8145)
He = GSL(7889)
Gouge = GSL(7902)
NoxiousPoison = GSL(7893)
Sorrow = GSL(8396)
Gloom = GSL(8397)
Misery = GSL(8395)
Defile = GSL(7958)
DarkMeditation = GSL(7954)
ManifestEmotions = GSL(7943)
Bane = GSL(7906)
DesperateMeasures = GSL(7956)
Bond = GSL(8017)
Mark = GSL(7941)
Debilitation = GSL(8415)

SendChatMessage("Point "..Rook.." away from the raid because of "..VengefulStrikes..".", c)
SendChatMessage("Move out of "..He.."'s "..NoxiousPoison.." puddles.  Tank face away for "..Gouge..".", c)
SendChatMessage("Kill order is "..Sorrow..", "..Gloom..", "..Misery..".  Keep "..Defile.." out of raid.", c)
SendChatMessage("Stack in the sphere to survive "..DarkMeditation.." and kill "..ManifestEmotions..".", c)
SendChatMessage("Dispel ".. Bane..".  Do not "..Mark.." the tank because of "..Debilitation..".", c)
SendChatMessage("Trigger AND COMPLETE "..DesperateMeasures.." in this order: 66% Rook , He, Sun, then 33% Rook, He, Sun.", c)
SendChatMessage("Finally, DPS all bosses evenly.  If one dies "..Bond.." will resurrect him unless the remaining bosses are killed quickly.", c)
