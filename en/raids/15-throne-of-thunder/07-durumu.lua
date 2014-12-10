-- Copyright (c) 2013 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Durumu

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

lfr = (d==5)

EJ_SetDifficulty(d)

-- end regularHeader.lua


local ForceOfWill = GSL(7859)
local LingeringGaze = GSL(6911)
if (lfr) then LingeringGaze = GSL(7751) end
local LifeDrain = GSL(6906)
local CrimsonFog = GSL(6892)
local AzureFog = GSL(6898)
local AmberFog = GSL(6895)
local EyeSore = GSL(6901)
local DisintegrationBeam = GSL(6882)
local SeriousWound = GSL(6880)
local ArterialCut = GSL(6881)

SendChatMessage("Run to the edge and drop the "..LingeringGaze.." puddle.  Take turns interrupting "..LifeDrain.." beam.", c)
if lfr then
   SendChatMessage("Blue and Red cone targets sweep to illuminate "..CrimsonFog.." and "..AzureFog.." then stop.  DPS burn Azure, Crimson, and "..AmberFog..".", c)
else
    SendChatMessage("Blue cone target stand still and never illuminate the "..AzureFog..".", c)
    SendChatMessage("Sweep the red cone to reveal the "..CrimsonFog..".  Kill all Crimson Fog to end the cone phase.", c)
end
SendChatMessage("Navigate the "..EyeSore.."s maze to avoid getting 1-shot by the "..DisintegrationBeam..".", c)
SendChatMessage("Dodge "..ForceOfWill.." to avoid getting knocked off the platform.", c)
SendChatMessage("Tanks take turns to let "..SeriousWound.." stacks fall off.  Heal tank to full to end the "..ArterialCut.." bleed.", c)
