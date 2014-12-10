-- Copyright (c) 2014 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/
-- ACmenu=IHML/bootstrap

function match(menu, label)
    if not menu then
        return nil
    end
    
    for i,v in ipairs(menu) do
        --        SendChatMessage(" check "..v["menulabel"], "SAY")
        if (v["menulabel"] == label) then
            if v["sub"] then
                return v["sub"]
            else
                return v["script"]
            end
        end
    end
end


function findScript(...)
    x = ArbitCommDB["profiles"]["Default"]["commands"]
    
    --    n=select("#", ...)
    --    SendChatMessage(" %s ".. ... , "SAY")
    for i,v in ipairs( {  ... } ) do
        --    SendChatMessage("%s"..v , "SAY")
        x=match(x, v)
    end
    
    --SendChatMessage("x="..x , "SAY")
    
    return x
end

findScript (  "IHML", "bootstrap" )

if not ArbitCommDB["ihml"] then
    ArbitCommDB["ihml"] = {}
end

ArbitCommDB["ihml"]["sunsong ranch"] = findScript("IHML", "sunsong ranch")
