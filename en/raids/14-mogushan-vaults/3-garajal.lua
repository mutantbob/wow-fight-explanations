-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/


function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
local c="SAY"
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficultyID()
  c="RAID"
end
if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
  c="INSTANCE_CHAT"
end

EJ_SetDifficulty(d)

local TSW =  GSL(5743)
local RevSpirit = GSL(6656)
local RetSoul = GSL(6657)
local minions = GSL(5739)
local dolls = GSL(5753)
local crossOver = GSL(6207)
local totem = GSL(5742)
local Frenzy = GSL(5759)


SendChatMessage(TSW.." will kill you in 30 seconds if you don't get "..RevSpirit.." and punch the "..RetSoul.." Button.", c)
SendChatMessage("While in "..TSW.." kill "..minions..", or they will pile up and kill the raid.  Make sure to "..RetSoul.." before you are killed.", c)
SendChatMessage(dolls.." can not enter "..TSW, c)
SendChatMessage("To "..crossOver..", stand near the "..totem.." and DPS it down.", c)
SendChatMessage("Once Gara'jal starts "..Frenzy.." we lose access to "..TSW..", so we must kill him before the "..minions.." overwhelm the raid.", c)

