
function recurseSection(sid)

   local title, description, headerType, abilityIcon, displayInfo, siblingID, nextSectionID, filteredByDifficulty, link, startsOpen, flag1 = EJ_GetSectionInfo(sid)

   local rval = sid.." "..title.."\n"

   if nextSectionID then

       rval = rval .. recurseSection(nextSectionID)

   end

   if siblingID then

       rval = rval .. recurseSection(siblingID)

    end

    return rval

end


for eid = 818, 820, 824 do

name, description, encounterID, rootSectionID, link = EJ_GetEncounterInfo(eid)

if not ArbitCommDB.debug then
   ArbitCommDB.debug = {}
end

ArbitCommDB.debug[eid] = recurseSection(rootSectionID)

end
