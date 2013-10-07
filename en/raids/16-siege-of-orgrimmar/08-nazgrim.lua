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

-- ACmenu=raids/Siege of Orgrimmar/Nazgrim

Sunder=GSL(7908)
Mage=GSL(7923)
Blue=GSL(7929)
Assassin=GSL(7924)
Shaman=GSL(7925)
ChainHeal=GSL(7935)
Totem=GSL(7936)
Iron=GSL(7922)
Rage=GSL(7909)
Aftershock=GSL(7911)
Ravager=GSL(7938)
BerserkerStance=GSL(7917)
DefensiveStance=GSL(7918)
Banner = GSL(7912)

SendChatMessage("Tanks take turns to let "..Sunder.." fall off.  Slow and kite "..Assassin..", and never turn your back to him.", c)
SendChatMessage("Interrupt or run out of "..Blue..".  Interrupt "..ChainHeal..".  Kill "..Totem..".", c)
SendChatMessage("Destroy "..Banner.." when he drops one.  Run out of "..Aftershock..".  Bloodlust during "..BerserkerStance..".", c)
SendChatMessage("Banner > "..Shaman.." > "..Mage.." > Assassin > "..Iron.." > boss .", c)
SendChatMessage("{skull}DO NOT ATTACK Nazgrim DURING "..DefensiveStance.." OR YOU GIVE HIM "..Rage.." WHICH HE USES TO {skull}"..Ravager.."{skull} US ALL TO DEATH{skull}.", c)
SendChatMessage("If we wipe, blame that idiot.", c)

