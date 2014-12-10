-- Copyright (c) 2014 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=IHML/sunsong ranch

--sunsong ranch

function print (msg)
    DEFAULT_CHAT_FRAME:AddMessage(
        msg ,
        
    1,0.7,0.5)
end

--

function matches(x, set)
    for i = 1,#set do        
        if (x==set[i]) then
            return x
        end
    end    
end

--

function scanBags(hunted)
    
    msg = "["
    for i= 0,NUM_BAG_SLOTS do
        
        for j = 1,GetContainerNumSlots(i) do
            
            id  = GetContainerItemID(i, j)
            if id then
                if (matches(id, hunted)) then
                    return id
                end  
                
                msg = msg .. ", "..id
            else
                msg = msg .. ",none"
            end            
        end        
    end
    
    msg = msg.."]"
    
    --    SendChatMessage(msg, "SAY")
    
end


function itemForSunsong()    
    n=GetNumQuestLogEntries()    
    questSeeds = {
        [31941] = 89328,
        [31670] = 80590,
        [31669] = 79102,
        [31674] = 80594,
        [31675] = 80595,
        [31943] = 89326,
        [31671] = 80591,
        [31673] = 80593,
        [31942] = 89329,
        [31672] = 80592
    }
    for i = 1,n do        
        title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i)
        
        if questSeeds[questID] and not isComplete then return questSeeds[questID] end
        --        if (questID == 31673) then
        --          return 80593
        --    end        
    end    
    
    x = scanBags( { 79102, 89328, 80590, 80592, 80594, 80593, 80591, 89329, 80595, 89326} )
    if x then return x end
    
    x = scanBags( {    85216, 85217, 89202, 85215, 89233, 89197} )
    if x then return x end
    
    x = scanBags( { 95449, 95451, 95457, 95447, 95445, 95454 } )
    if x then return x end
    x = scanBags( { 84782 } )
    if x then return x end
    
    return 89815    
end

x = scanBags( { 79102, 89328, 80590, 80592, 80594, 80593, 80591, 89329, 80595, 89326 } )
if not  x  then x="none" end

--SendChatMessage("bags "..x, "SAY")

sunsong = itemForSunsong()

-- print( " sunsong "..sunsong)

DEF_ICON = "Interface\Icons\INV_Misc_QuestionMark"

name, icon, body, isLocal = GetMacroInfo("ihml")

newBody="#showtooltip item:"..sunsong.."\n"..
"/use item:"..sunsong.."\n"..
"#########################################################################################\n"..
'/run LibStub("LibFarmbuyer").safecall(loadstring( ArbitCommDB["ihml"]["sunsong ranch"] ))\n'

--SendChatMessage(""..icon.."    "..name, SAY)
if name then
    m=    EditMacro(name, nil, nil, newBody, 1, 1)
    --    SendChatMessage(" new "..m, "SAY")
else
    CreateMacro("ihml", DEF_ICON, newBody, nil, 1) 
end



-- x
