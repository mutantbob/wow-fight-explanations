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

-- ACmenu=raids/Siege of Orgrimmar/Norushen

BlindHatred = GSL(8219)
Reliance = GSL(8222)
Confidence = GSL(8223)
HurlCorruption = GSL(8244)
TitanicSmash = GSL(8242)
Serenity = GSL(8221)
UnleashedCorruption = GSL(8231)
ResidualCorruption = GSL(8248)
ExpelCorruption = GSL(8249)
FoulLink = GSL(8482)

SendChatMessage("Healers: heal NPCs to win "..Reliance..".  DPS, faceroll "..Serenity..", but get behind the shielded adds.",c)
SendChatMessage("Tanks survive "..Confidence.." by interrupting "..HurlCorruption.." and dodging "..TitanicSmash..".", c)
SendChatMessage("Destroy "..UnleashedCorruption.." adds.  Stay out of the "..BlindHatred.." death laser.", c)
SendChatMessage("Soak the "..ResidualCorruption.." to prevent raid-wide damage.  Intercept the "..ExpelCorruption.." balls to prevent the boss from getting a buff.", c)
SendChatMessage("Adds are priority because of "..FoulLink..".  If you are attacking the boss while adds are up, you're probably doing it wrong.", c)
