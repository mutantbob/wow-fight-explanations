-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/death snails

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

local Devoured = GetSpellLink(134415)


SendChatMessage("DO NOT MESS AROUND WITH DEATH SNAILS.  DEATH SNAILS WILL MAKE YOU DIE!", c)
SendChatMessage("If you stand in front of the DEATH SNAIL you will be "..Devoured..".  If you try to tank DEATH SNAIL you will be "..Devoured..".", c)
SendChatMessage("Attack from ranged, or maybe from the side, but be ready for him to change target and direction", c)
SendChatMessage("Somebody will think I'm joking and they will DIE and realize that I AM NOT JOKING.", c)

