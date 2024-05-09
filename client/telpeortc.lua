ESX = nil 
Citizen.CreateThread(function() 
while ESX == nil do 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.Wait(0) 
end 
end)

local isDead = false
local display = false
local isMenuOpen = false
local notifications = false
local hasRun = false
local isDead = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(24)
        if (not isDead and NetworkIsPlayerActive(PlayerId()) and IsPedFatallyInjured(PlayerPedId())) then
            isDead = true
            DisableControlAction(   46, true)
        elseif (isDead and NetworkIsPlayerActive(PlayerId()) and not IsPedFatallyInjured(PlayerPedId())) then
            isDead = false
            EnableControlAction(   46, true)
        end
    end
  end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))
            if GetDistanceBetweenCoords(coords, Teleport.marker, true) <= 0.75 then
                ESX.ShowHelpNotification("Drücke E um die Teleports zu öffnen.")
              if IsControlJustReleased(0, 38) and not isMenuOpen then
                        OpenMenu()
              end
            end
        end
    end)

    Citizen.CreateThread(function()
        while true do
        Citizen.Wait(0)
            local coords = GetEntityCoords(GetPlayerPed(-1))
                if GetDistanceBetweenCoords(coords, -2275.1748, 329.7901, 174.6019, true) <= 4.75 then
                    DrawMarker(30, -2275.1748, 329.7901, 174.6019, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, true, 2, false, false, false, false)
                    ESX.ShowHelpNotification("Drücke E um zurück zum MD zu gelangen")
                    if IsControlJustReleased(0, 38) then
                        ESX.Game.Teleport(PlayerPedId(), vector3(299.8022, -575.5121, 43.24829)) 
                        RegisterNetEvent('KERAxCLS')
                        TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast die EKZ Zone verlassen', 15000)
                  end
                end
            end
        end)

        Citizen.CreateThread(function()
            while true do
            Citizen.Wait(0)
                local coords = GetEntityCoords(GetPlayerPed(-1))
                    if GetDistanceBetweenCoords(coords, 495.0568, -66.9538, 88.8495, true) <= 4.75 then
                        DrawMarker(30, 495.0568, -66.9538, 88.8495, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, true, 2, false, false, false, false)
                        ESX.ShowHelpNotification("Drücke E um zurück zum MD zu gelangen")
                        if IsControlJustReleased(0, 38) then
                            ESX.Game.Teleport(PlayerPedId(), vector3(299.8022, -575.5121, 43.24829)) 
                            RegisterNetEvent('KERAxCLS')
                            TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast dass parkdeck verlassen', 15000)
                      end
                    end
                end
            end)

            Citizen.CreateThread(function()
                while true do
                Citizen.Wait(0)
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                        if GetDistanceBetweenCoords(coords, -34.9376, -1105.2579, 26.4223, true) <= 4.75 then
                            DrawMarker(30, -34.9376, -1105.2579, 26.4223, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, true, 2, false, false, false, false)
                            ESX.ShowHelpNotification("Drücke E um zurück zum MD zu gelangen")
                            if IsControlJustReleased(0, 38) then
                                ESX.Game.Teleport(PlayerPedId(), vector3(299.8022, -575.5121, 43.24829)) 
                                RegisterNetEvent('KERAxCLS')
                                TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast dass Parkdeck verlassen', 15000)
                          end
                        end
                    end
                end)

                Citizen.CreateThread(function()
                    while true do
                    Citizen.Wait(0)
                        local coords = GetEntityCoords(GetPlayerPed(-1))
                            if GetDistanceBetweenCoords(coords, 13.6619, -1103.7000, 29.7970, true) <= 4.75 then
                                DrawMarker(30, 13.6619, -1103.7000, 29.7970, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, true, 2, false, false, false, false)
                                ESX.ShowHelpNotification("Drücke E um zurück zum MD zu gelangen")
                                if IsControlJustReleased(0, 38) then
                                    ESX.Game.Teleport(PlayerPedId(), vector3(299.8022, -575.5121, 43.24829)) 
                                    RegisterNetEvent('KERAxCLS')
                                    TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast dass Parkdeck verlassen', 15000)
                              end
                            end
                        end
                    end)

            Citizen.CreateThread(function()
                while true do
                Citizen.Wait(0)
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                        if GetDistanceBetweenCoords(coords, -325.5337, -775.7021, 53.2394, true) <= 4.75 then
                            DrawMarker(30, -325.5337, -775.7021, 53.2394, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, true, 2, false, false, false, false)
                            ESX.ShowHelpNotification("Drücke E um Das Parkdeck Menu zu öffnen")
                            if IsControlJustReleased(0, 38) then
                                ESX.Game.Teleport(PlayerPedId(), vector3(299.8022, -575.5121, 43.24829)) 
                                RegisterNetEvent('KERAxCLS')
                                TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast dass parkdeck verlassen', 15000)
                          end
                        end
                    end
                end)
      
local pos = {x = 299.8022, y = -575.5121, z = 43.24829, rot = 343.19} 
Citizen.CreateThread(function()
    local scale = 1.0
    while true do 
        DrawMarker(41, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.8, 0.8, 1.0, 10, 0, 0, 255, false, false, 2, true, false, false, false)
        Citizen.Wait(1)
    end
end)

function TeleportPR(coords) -- SKATEPARK
    local coords = Teleport.Teleports.pr.spawnpoints[math.random(#Teleport.Teleports.pr.spawnpoints)]  
    SetEntityCoords(GetPlayerPed(-1), coords, false, false, false, false)
    TriggerEvent('loadout')
end

function TeleportWP(coords) -- WUERFELPARK
    local coords = Teleport.Teleports.wp.spawnpoints[math.random(#Teleport.Teleports.wp.spawnpoints)]
    SetEntityCoords(GetPlayerPed(-1), coords, false, false, false, false)
    TriggerEvent('loadout')
end

function TeleportCS(coords) -- WUERFELPARK
    local coords = Teleport.Teleports.cs.spawnpoints[math.random(#Teleport.Teleports.cs.spawnpoints)]
    SetEntityCoords(GetPlayerPed(-1), coords, false, false, false, false)
    TriggerEvent('loadout')
end

function TeleportWS(coords) -- WUERFELPARK
    local coords = Teleport.Teleports.ws.spawnpoints[math.random(#Teleport.Teleports.ws.spawnpoints)]
    SetEntityCoords(GetPlayerPed(-1), coords, false, false, false, false)
    TriggerEvent('loadout')
end

function TeleportAP(coords) -- Abschlephof
    local coords = Teleport.Teleports.ap.spawnpoints[math.random(#Teleport.Teleports.ap.spawnpoints)]
    SetEntityCoords(GetPlayerPed(-1), coords, false, false, false, false)
    TriggerEvent('loadout')
end

function OpenMenu()
    ESX.TriggerServerCallback('getpindiuff', function(count)
    	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
        title = "Teleports by Xenon",
        align = "right",
        elements = {
            {label = "Parkdeck EKZ", value='teleport_wuerfelpark'},
            {label = "Parkdeck Police", value='teleport_skatepark'},
            {label = "Parkdeck Red", value='teleport_abschlephof'},
            {label = "Waffenshop", value='teleport_waffenshop'},
            {label = "Autoshop", value='teleport_carshop'},
        }
    }, function (data, menu)
        ESX.UI.Menu.CloseAll()

            if data.current.value == 'teleport_wuerfelpark' then

                        TriggerServerEvent('insertinnee')
                        TeleportWP() --wuerfelpark
            end

            if data.current.value == 'teleport_skatepark' then
                
               
                        TriggerServerEvent('insertinnee')
                        TeleportPR() --skatepark
                    end

                    if data.current.value == 'teleport_waffenshop' then
                
               
                        TriggerServerEvent('insertinnee')
                        TeleportWS() --skatepark
                    end

                    if data.current.value == 'teleport_carshop' then
                
               
                        TriggerServerEvent('insertinnee')
                        TeleportCS() --skatepark
                    end
            if data.current.value == 'teleport_abschlephof' then
                
                    TriggerServerEvent('insertinnee')
                    TeleportAP() --Abschlephof
                end
    end, 
    function (data, menu) 
        menu.close()    
    end)
end)
end

local firstspawn = true
AddEventHandler('playerSpawned', function(spawn)
if not firstspawn then
    firstspawn = true
    while GetEntityModel(GetPlayerPed(-1)) ~= 1885233650 do
    Citizen.Wait(200)    
    end
    ESX.TriggerServerCallback('isIn', function(bool) 
        
        if bool then
            
            RemoveAllPedWeapons(GetPlayerPed(-1), false)
        end
    end)
end
end)

function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringKeyboardDisplay(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

  RegisterNetEvent('loadout')
  AddEventHandler('loadout', function ()
      SetEntityHealth(PlayerPedId(-1), 200)
      SetPedArmour(PlayerPedId(-1), 200)
      
  end)
  
  RegisterNetEvent('KERAxCLS')
  AddEventHandler('KERAxCLS', function ()
      SetEntityHealth(PlayerPedId(-1), 200)
      SetPedArmour(PlayerPedId(-1), 0)
      TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'KERAxCLS system', 'Du hast dass parkdeck verlassen', 15000)
  end)


  