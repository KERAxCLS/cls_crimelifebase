Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)




RegisterCommand('atts', function()
	TriggerEvent('KERAxCLS:ausatz')
	Citizen.Wait(100)
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast jetzt deine drecks Aufsätzte !', 15000)
end)
   

RegisterNetEvent('KERAxCLS:ausatz')
AddEventHandler('KERAxCLS:ausatz', function()
	local ped = PlayerPedId()
	if  GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_APPISTOL_CLIP_01"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_APPISTOL_CLIP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_carbinerifle_mk2") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_AT_AR_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_04"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle_mk2"),GetHashKey("COMPONENT_AT_SIGHTS"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_bullpuprifle") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_AT_AR_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_04"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_bullpuprifle"),GetHashKey("COMPONENT_AT_SIGHTS"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_PI_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_carbinerifle") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle"),GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle"),GetHashKey("COMPONENT_AT_AR_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_carbinerifle"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_specialcarbine") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_specialcarbine"),GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_specialcarbine"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_specialcarbine"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_gusenberg") then
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_HEAVYPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_HEAVYPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_HEAVYPISTOL"),GetHashKey("COMPONENT_AT_AR_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL50") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL50"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL50"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_advancedrifle") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_advancedrifle"),GetHashKey("COMPONENT_AT_AR_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_advancedrifle"),GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_advancedrifle"),GetHashKey("COMPONENT_AT_AR_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_pistol_mk2") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_pistol_mk2"),GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_pistol_mk2"),GetHashKey("COMPONENT_AT_PI_RAIL"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_pistol_mk2"),GetHashKey("COMPONENT_AT_PI_COMP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_pistol_mk2"),GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06_SLIDE"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("weapon_machinepistol") then
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_machinepistol"),GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_machinepistol"),GetHashKey("COMPONENT_AT_PI_SUPP"))
		GiveWeaponComponentToPed(ped,GetHashKey("weapon_SPECIALCARBINE_MK2"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	end
end)

-----car clean-------
RegisterNetEvent("VehicleDespawner:notification")
AddEventHandler("VehicleDespawner:notification", function(msg)
    TriggerEvent('notifications', "#ff0000", "Abschlepphof", msg)
end)
--------------------------
--stamina
--------------------------
Citizen.CreateThread( function()
 while true do
    Citizen.Wait(80)
    RestorePlayerStamina(PlayerId(), 1.0)
	end
end)
--------------------------
--antiwaffenschlag
--------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = GetPlayerPed( -1 )
		local weapon = GetSelectedPedWeapon(ped)
		if IsPedArmed(ped, 6) then
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

--ID Command
RegisterCommand("id", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
	TriggerEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Deine ID: ' ..GetPlayerServerId(PlayerId()).. ' ')
end)
--------------------------


--------------------------
local validWeapons = {
	-- Pistols
	'WEAPON_HEAVYPISTOL',
}

function KillYourself()
	Citizen.CreateThread(function()
		local playerPed = GetPlayerPed(-1)

		local canSuicide = true
		local foundWeapon = nil

		for i=1, #validWeapons do
			if HasPedGotWeapon(playerPed, GetHashKey(validWeapons[i]), false) then
				if GetAmmoInPedWeapon(playerPed, GetHashKey(validWeapons[i])) > 0 then
					canSuicide = true
					foundWeapon = GetHashKey(validWeapons[i])

					break
				end
			end
		end

		if canSuicide then
			SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
			SetEntityHealth(playerPed, 0)
		end
	end)
end

RegisterCommand('die', function()
	TriggerEvent("notifications", '#ff0000', " LuckyCL System", "Du bist gestorben", 2500)
Citizen.Wait(0)
	KillYourself()  
end, false)



--fps boost/Leak sicht
local fps = false
RegisterCommand("fps", function()  -- enable/disable fps boos
        SetTimecycleModifier("cinema")
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
		TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast den FPS Boost aktiviert', 15000)
	end)

	RegisterCommand("fpsoff", function()  -- enable/disable fps boos
	SetTimecycleModifier("default")
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast den FPS Boost Deaktiviert', 15000)
    end)

--Tag/nacht command
RegisterCommand("day", function()  --set day
    SetWeatherTypePersist("EXTRASUNNY")
    SetWeatherTypeNow("EXTRASUNNY")
    SetWeatherTypeNowPersist("EXTRASUNNY")
    NetworkOverrideClockTime(13, 00, 00)
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast dass Wetter zu Tag geändert', 15000)
end)

RegisterCommand("night", function()  -- set night
    SetWeatherTypePersist("EXTRASUNNY")
    SetWeatherTypeNow("EXTRASUNNY")
    SetWeatherTypeNowPersist("EXTRASUNNY")
    NetworkOverrideClockTime(00, 00, 00)
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast dass Wetter zu Nacht geändert', 15000)
end)

-------------------------------------------------------------------------------------------------------------
--Commands/teleporter
-------------------------------------------------------------------------------------------------------------



RegisterCommand('skin', function(source)
  local playerPed = GetPlayerPed(-1)
	Citizen.Wait(100)
TriggerEvent('esx_skin:openSaveableMenu')
end)

RegisterCommand('skinmenu', function(source)
  local playerPed = GetPlayerPed(-1)
	Citizen.Wait(1)
TriggerEvent('esx_skin:openSaveableMenu')
end)





RegisterCommand('md123', function(source)
	local playerPed = GetPlayerPed(-1)
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Du hast dich Teleportiert!', 15000)
	  Citizen.Wait(0)
		  ESX.Game.Teleport(PlayerPedId(), vector3(296.4713, -584.2515, 43.5378)) 
  end)


-----hEAL AFTER KILL

RegisterNetEvent('healplayerafterkill')
AddEventHandler('healplayerafterkill', function ()
    AddArmourToPed(PlayerPedId(), 99)
	SetEntityHealth(PlayerPedId(-1), 200)
	TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky system', 'Deine Rüstung und dein Leben wurde aufgestockt', 15000)

end)
-----
