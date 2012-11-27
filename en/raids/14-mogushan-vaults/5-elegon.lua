-- Copyright (c) 2012 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

function GSL(sid)
   local a={ EJ_GetSectionInfo(sid) }
   return a[9]
end

local d = 1;
if "raid" == ({IsInInstance()})[2] then
  d = GetRaidDifficulty()
end
EJ_SetDifficulty(d)



local CelestialBreath = GSL(6184)
local CelestialProtector = GSL(6178)
local Overcharged = GSL(6173)
local Phasing = GSL(6179)
local TotalAnnihilation = GSL(6186)
local DrawPower = GSL(6187)
local EnergyCharge = GSL(6189)
local HighEnergy = GSL(6191)
local EmpyrealFocus = GSL(6193)
local CosmicSpark = GSL(6198)
local RadiatingEnergies = GSL(6192)
local TouchTitans = GSL(6172)
local StabilityFlux = GSL(6185)
local Discharge = GSL(6190)


local c="raid"


CHAT(c, "Only the tank should be in front of Elegon because of "..CelestialBreath..".")
if d ~= 5 then
    CHAT(c, "When the "..CelestialProtector.." materializes, tanks swap.  The protector tank should taunt and run to the edge of the platform to ditch "..Overcharged.." stacks.")
    CHAT(c, "Make sure the protector is on the platform so he is not protected by "..Phasing..".")
    CHAT(c, "When protector's health is <25% kite it off the platform because "..TotalAnnihilation.." plus "..StabilityFlux.." enhanced by "..TouchTitans.." is deadly.")
    CHAT(c, "All DPS and healers should drop Overcharged stacks before Stability Flux.")
end
CHAT(c, "After elegon casts "..DrawPower.." all players kill "..EnergyCharge.."s to stack a debuff on Elegon.  Waves of these keep coming.")
CHAT(c, "Drop "..Overcharged.." stacks before killing the Energy Charge because "..Discharge.." hurts.")
CHAT(c, "Eventually "..HighEnergy.." will enable a charge to reach an "..EmpyrealFocus.." and the central platform will disappear, dropping any clueless players to their death.")
CHAT(c, "Blast all 6 "..EmpyrealFocus.." to respawn the platform.  Destroy any "..CosmicSpark.."s and resume attacking the boss.")
CHAT(c, "After the second cycle "..RadiatingEnergies.." will quickly kill any players who are slow to return to the center.")
