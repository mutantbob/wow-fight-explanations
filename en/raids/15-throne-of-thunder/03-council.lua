-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=raids/Throne of Thunder/Council of Elders.lua


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

local FrigidAssault = GSL(7054)
local Overload = GSL(7059)
local Quicksand = GSL(7062)
local Sandstorm = GSL(7065)
local LivingSand = GSL(7066)
local Fortified = GSL(7067)
local BlessedLoaSpirit = GSL(7070)
local ShadowedLoaSpirit = GSL(7072)
local Sul = GSL(7049)
local Marli = GSL(7050)
local Garajal = GSL(7051)

SendChatMessage("When "..FrigidAssault.." stacks to 15 the tank is frozen.  Heal it like you mean it.", c)
SendChatMessage("Beware of "..Overload.." (reflection) when Kara'jin is posessed.", c)
SendChatMessage("Stay out of "..Quicksand..".  During "..Sandstorm.." quickly kill "..LivingSand.." before they get "..Fortified..".", c)
SendChatMessage("Snare and do not let "..BlessedLoaSpirit.." live long enough to heal a boss.  Kill "..ShadowedLoaSpirit.." before it kills its victim.", c)
SendChatMessage("Kill order is "..Sul..", "..Marli..", whatever.  Tank Mar'li far from the other bosses.", c)
SendChatMessage("Whoever turns tall and purple has "..Garajal..".  Beat the purple out of them before he/she kills us.", c)
