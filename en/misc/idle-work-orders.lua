-- Copyright (c) 2014 Robert Forsman
-- This work is made available under the terms of the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 license, http://creativecommons.org/licenses/by-nc-sa/3.0/

--ACmenu=idle work orders

function print (msg)
    DEFAULT_CHAT_FRAME:AddMessage(
        msg ,
        
    1,0.7,0.5)
    
end

function careAbout(server, player, plotName)
    if plotName == "Herb Garden" or plotName=="Frostwall Mines" then
        return false
    end
    if plotName=="Salvage Yard" then
        return false
    end
    if plotName=="Barracks" or plotName=="Frostwall Tavern" then 
        return false
    end
    if plotName=="Barn" then 
        return player == "Igoar" or player=="Fabricia" or player == "Immolatrix" 
    end
    
    if plotName=="Fishing Shack" or plotName==22 then 
        return false
    end
    if plotName == "Enchanter's Study" then 
        return player == "Lucrelucia"
    end
    
    return true
end

function doomString(seconds)
    
    return string.format("%6.1f hr",seconds/60/60)    
end

function scanPlayer(db, server, pname)
    now = time()
    for plotID,building in pairs(db["buildings"]) do
        if careAbout(server, pname, building["name"]) then
            x = building["shipment"]
            total = x["shipmentsTotal"]
            if total then
                inProgress = x["shipmentsInProgress"]
                ct = x["creationTime"]
                dt = ct + 4*60*60*inProgress
                expireSecs = dt-now
                
                --print(pname.."-"..server.." plotID="..plotID.." "..x["name"].."; "..total.." done in "..doomString(expireSecs))
            else
                --print(pname.."-"..server.." plotID="..plotID.." "..building["name"]..";  idle")
                dt = now
            end
            
            perBuilding[1+#perBuilding] = {
                ["idleTime"] = dt,
                ["server"] = server,
                ["playerName"] = pname,
                ["name"] = building["name"],
                ["shipment"] = x
            }
            
        end
    end    
end


function scanServer(db, server)
    for pname, hash in pairs(db) do
        scanPlayer(hash, server, pname)
    end
end

perBuilding = {}

for server,hash in pairs(Broker_GarrisonDB["global"]["data"]) do
    scanServer(hash, server)
end


table.sort(perBuilding, function(a,b) return a["idleTime"] > b["idleTime"] end)

now = time()
for k,v in pairs(perBuilding) do
    expireSec = v["idleTime"]-now
    print(v["playerName"].."-"..v["server"].." "..v["name"].." idle in "..doomString(expireSec))
end
