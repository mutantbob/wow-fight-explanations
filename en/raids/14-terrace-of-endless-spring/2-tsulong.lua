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


local ShadowBreath = GSL(6313)
local Sunbeam = GSL(6314)
local DreadShadows = GSL(6311)
local Nightmares = GSL(6312)
local TheDay = GSL(6315)
local BathedInLight = GSL(6324)
local Terrorize = GSL(6317)
local UnstableSha = GSL(6320)
local EmbodiedTerror = GSL(6316)
local SunBreath = GSL(6323)
local FrightSpawn = GSL(6318)
local TheNight = GSL(6310)

SendChatMessage("Only 1 tank should be in front of the boss because of "..ShadowBreath..".  Tanks should take turns to avoid taking 2 in a row.", c)
SendChatMessage("All players (except current tank) run through "..Sunbeam.." to scrub off "..DreadShadows.." after 6 stacks, but don't stand in it or you'll funk it up with ", c)
SendChatMessage(Nightmares..".  During "..TheDay.." healers stack in front of Tsulong to get "..BathedInLight..".  Cleanse "..Terrorize.." from ", c)
SendChatMessage("Tsulong.  DPS blow up all adds, but "..UnstableSha.." (medium sized) are priority.  Tanks should tank "..EmbodiedTerror.." (tall) in "..SunBreath..".", c)
SendChatMessage("Remember to pick up the "..FrightSpawn.." (short) that appear after the Embodied Terror dies.  These are lower priority.", c)
SendChatMessage("Damage Tsulong during "..TheNight.." and heal him during "..TheDay.." to win.", c)