-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/


SL(sid)
    local a={ EJ_GetSectionInfo(sid) }
    return a[9]
end
EJ_SetDifficulty(1) -- 10 normal


local TSW =  GSL(5743)
local RevSpirit = GSL(6656)
local RetSoul = GSL(6657)
local minions = GSL(5739)
local dolls = GSL(5753)
local crossOver = GSL(6207)
local totem = GSL(5742)
local Frenzy = GSL(5759)


local c="raid"


CHAT(c, TSW.." will kill you in 30 seconds if you don't get "..RevSpirit.." and punch the "..RetSoul.." Button.")
CHAT(c, "While in "..TSW.." kill "..minions..", or they will pile up and kill the raid.  Make sure to "..RetSoul.." before you are killed.")
CHAT(c, dolls.." can not enter "..TSW)
CHAT(c, "To "..crossOver..", stand near the "..totem.." and DPS it down.")
CHAT(c, "Once Gara'jal starts "..Frenzy.." we lose access to "..TSW..", so we must kill him before the "..minions.." overwhelm the raid.")

