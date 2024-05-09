local aduty = false
local showNames = false
local godmode = false
local headDots = false
local health = false
local invis = false
local noclip = false
local espDistance = 100
ESX = nil



function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if aduty then
			SetSuperJumpThisFrame(PlayerId())
		end
	end
end)



RegisterCommand('noclip', function(source, args)
    if aduty then
        noclip = not noclip
        if noclip then
            invis = true
            TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMINY', 'Du hast deinen NoClip angeschaltet!', 15000)
        end
        if not noclip then
            TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du hast deinen NoClip ausgeschaltet!', 15000)
            invis = false
        end
    else
        TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du bist nicht in Aduty!', 15000)
    end
end)


RegisterCommand('joingw', function(source, args)
    if aduty then
TriggerServerEvent('KERAxCLS:setDimension', 69)
TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Deine Dimension wurde gewechselt', 15000)
    end
end)

RegisterCommand('quitgw', function(source, args)
    if aduty then
TriggerServerEvent('KERAxCLS:setDimension', 0)
TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Deine Dimension wurde gewechselt', 15000)
    end
end)



RegisterCommand('hash', function(source, args)
    if aduty then
        ESX.ShowNotification(GetHashKey(table.concat(args)))
    else
        TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du bist nicht im Aduty!', 15000)
    end
end)


RegisterNetEvent("EasyAdmin:TeleportRequestss")

AddEventHandler('EasyAdmin:TeleportRequestss', function(id, tgtCoords)
	if id then
		if (tgtCoords.x == 0.0 and tgtCoords.y == 0.0 and tgtCoords.z == 0.0) then
			local tgtPed = GetPlayerPed(GetPlayerFromServerId(id))
			tgtCoords = GetEntityCoords(tgtPed)
		end
		SetEntityCoords(PlayerPedId(), tgtCoords.x, tgtCoords.y, tgtCoords.z,0,0,0, false)
	else
		SetEntityCoords(PlayerPedId(), tgtCoords.x, tgtCoords.y, tgtCoords.z,0,0,0, false)
	end
end)






TeleportToWaypoint = function()
    local WaypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(20)
         end

         TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du hast dich Teleportiert', 15000)
    else
        TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du musst eine Makierung auf der Karte setzten!', 15000)
    end
end

RegisterCommand('tpm', function(source, args)
    if aduty then
        TeleportToWaypoint()
    else
        TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du bist nicht im Aduty!', 15000)
    end
end)



RegisterCommand('tc', function(source, args)
    TriggerServerEvent('tc', table.concat(args, " " ))
end)

RegisterNetEvent('teleport')
AddEventHandler('teleport', function(x,y,z)
    SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
end)


RegisterNetEvent('adminnotify2')
AddEventHandler('adminnotify2', function(msg, title)
    ESX.TriggerServerCallback('KERAxCLS:getgroups', function(group)
        if group == "superadmin" or group == "admin" or group == "mod" or group == "manager" or group == "frak" or group == "projektleitung" or group == "support" then
            TriggerEvent('KERAxCLS_hud:notify', "#fff", "ADMIN - ".. title, "".. title..": "..msg)
        end
    end)
end)

local DrawText3D = function(x, y, z, text, r, g, b, scale)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(0, scale or 0.2)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0, 0)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local VibeIKeys = { ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["INSERT"] = 121, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["UP"] = 172, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["MOUSE1"] = 24 }

local currentcurrentNoclipSpeed = 1
local oldSpeed = nil

local GetCamDirection = function()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)
    
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    
    return x, y, z
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsDisabledControlJustPressed(0, 166) then
        Wait(150)
            if aduty then
                noclip = not noclip
                if noclip then
                    TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du hast den NoClip angeschaltet!', 15000)
                    invis = true
                end
                if not noclip then
                    TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du hast d en NoClip ausgeschaltet!', 15000)
                    invis = false
                end
            end
        end

        if noclip then

            local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
            local k = nil
            local x, y, z = nil
            
            if not isInVehicle then
                k = PlayerPedId()
                x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
            else
                k = GetVehiclePedIsIn(PlayerPedId(), 0)
                x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
            end
            
            local dx, dy, dz = GetCamDirection()
            
            SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
            
            if IsDisabledControlJustPressed(0, VibeIKeys["LEFTSHIFT"]) then
                oldSpeed = currentNoclipSpeed
                currentNoclipSpeed = currentNoclipSpeed * 3
            end
            if IsDisabledControlJustReleased(0, VibeIKeys["LEFTSHIFT"]) then
                currentNoclipSpeed = oldSpeed
            end
            if currentNoclipSpeed == nil then currentNoclipSpeed = 1 end
            if IsDisabledControlPressed(0, 32) then
                x = x + currentNoclipSpeed * dx
                y = y + currentNoclipSpeed * dy
                z = z + currentNoclipSpeed * dz
            end
            
            if IsDisabledControlPressed(0, 269) then
                x = x - currentNoclipSpeed * dx
                y = y - currentNoclipSpeed * dy
                z = z - currentNoclipSpeed * dz
            end
			
			if IsDisabledControlPressed(0, VibeIKeys["SPACE"]) then
                z = z + currentNoclipSpeed
            end
            
			if IsDisabledControlPressed(0, VibeIKeys["LEFTCTRL"]) then
                z = z - currentNoclipSpeed
            end
            
            
            SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
        end
        if invis then
            SetEntityVisible(PlayerPedId(), false, false)
        else
            SetEntityVisible(PlayerPedId(), true, false)
        end

            local players = GetActivePlayers()
			for i = 1, #players do

				local currentplayer = players[i]
                local ped = GetPlayerPed(currentplayer)

                local headPos = GetPedBoneCoords(ped, 0x796E, 0, 0, 0)
                
                if GetDistanceBetweenCoords(headPos.x, headPos.y, headPos.z, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, false) < espDistance then
                    if headDots then

					if NetworkIsPlayerTalking(currentplayer) then
                        DrawText3D(headPos.x, headPos.y, headPos.z + 0.7, GetPlayerServerId(currentplayer) .." " .. GetPlayerName(currentplayer) .. " 🎙 ", 196, 196, 196, 0.6)

                    else
				   	 DrawText3D(headPos.x, headPos.y, headPos.z + 0.7, GetPlayerServerId(currentplayer) .. " | " .. GetPlayerName(currentplayer), 196, 196, 196, 0.6)

				   end
					
                        DrawText3D(headPos.x, headPos.y, headPos.z + 0.1, "", 255, 255, 0, 0.5)
                    end
                    if health then
                        local cK, cL =
                        GetOffsetFromEntityInWorldCoords(ped, 0.75, 0.0, -0.8),
                        GetOffsetFromEntityInWorldCoords(ped, 0.75, 0.0, 0.6)
                        local be, cu, cv = GetScreenCoordFromWorldCoord(table.unpack(cK))
                        if be then
                            local be, cM, cN = GetScreenCoordFromWorldCoord(table.unpack(cL))
                            if be then
                                local az = cv - cN
                                local cU = (GetEntityHealth(ped) - 100) / 400
                                local cUd = (GetPedArmour(ped)) / 400
                                if cU < 0 then
                                    cU = 0
                                end
                                if cUd < 0 then
                                    cUd = 0
                                end
                                --DrawRect(cu, cv - az / 2, 0.005 * az, az, 255, 33, 33, 255)
                                if cU > 0 then
                                    DrawRect(cu, cv - az / 2, 0.005 * az, az * cU * 4, 33, 255, 33, 255)
                                end
                                if cUd > 0 then
                                    DrawRect(cu - 0.005, cv - az / 2, 0.005 * az, az * cU * 4, 0, 0, 255, 255)
                                end
                            end
                        end
					end
				end
			end
		end
			    end)

function cleanPlayer(playerPed)
    SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function setUniform(group)
    local playerPed = PlayerPedId()
    
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
           if group == "projektleitung" then
               -- if GetPlayerName(PlayerId()) == "KiSS4ME" then
                    --TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.kian.male)
               -- else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.projektleitung.male)
               -- end
            elseif group == "superadmin" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.superadmin.male)
			 elseif group == "admin" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.admin.male)
            elseif group == "mod" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.mod.male)
            elseif group == "support" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.support.male)
            elseif group == "projektleitung" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.anna.projektleitung.female)				
            elseif group == "guide" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.guide.male)		
            elseif group == "sad" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.sad.male)	
            elseif group == "manager" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.manager.male)								
            end
        else
            if group == "superadmin" then
                if GetPlayerName(PlayerId()) == "anna" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.anna.female)
                else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.superadmin.female)
                end
            elseif group == "admin" then
                if GetPlayerName(PlayerId()) == "anna" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.anna.female)	
                else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.admin.female)	
                end
		    elseif group == "guide" then
                if GetPlayerName(PlayerId()) == "anna" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.anna.female)	
                else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.guide.female)	
                end
			elseif group == "projektleitung" then
                if GetPlayerName(PlayerId()) == "anna" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.anna.female)	
                else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.manager.female)	
                end
            elseif group == "mod" then
                TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.mod.female)
            elseif group == "support" then
                if GetPlayerName(PlayerId()) == "anna" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.anna.female)	
                else
                    TriggerEvent("skinchanger:loadClothes", skin, Config.KERAxCLS.support.female)	
                end
            end
        end
    end)
end

Citizen.CreateThread(function() --Godmode
	while true do
		Citizen.Wait(1)

		if godmode then
			SetEntityInvincible(GetPlayerPed(-1), true)
			SetPlayerInvincible(PlayerId(), true)
			SetPedCanRagdoll(GetPlayerPed(-1), true)
			ClearPedBloodDamage(GetPlayerPed(-1))
			ResetPedVisibleDamage(GetPlayerPed(-1))
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			SetEntityCanBeDamaged(GetPlayerPed(-1), false)
        else
			SetEntityInvincible(GetPlayerPed(-1), false)
			SetPlayerInvincible(PlayerId(), false)
			SetPedCanRagdoll(GetPlayerPed(-1), true)
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			SetEntityCanBeDamaged(GetPlayerPed(-1), true)
		end
	end
end)

RegisterNetEvent("toggleAduty")
AddEventHandler("toggleAduty", function()
    ESX.TriggerServerCallback('KERAxCLS:getgroups', function(group)
        if group == "superadmin" or group == "projektleitung" or group == "admin" or group == "mod" or group == "guide" or group == "support" or group == "owner" or group == "manager" or group == "sad"then
            local playerPed = PlayerPedId()
            if aduty then
                aduty = false
                showNames = false
                godmode = false
                headDots = false
                health = false
                TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du bist aus den Aduty raus gegangen!', 15000)
                TriggerEvent("updateaduty", false)
                SetRunSprintMultiplierForPlayer(PlayerId(),1.08)
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            else
                aduty = true
                TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'ADMIN', 'Du bist in den Aduty gegangen!', 15000)
                TriggerEvent("updateaduty", true)
                SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
                setUniform(group)
                showNames = true
                godmode = true
                headDots = true
                health = true
            end
        end
    end)
end)