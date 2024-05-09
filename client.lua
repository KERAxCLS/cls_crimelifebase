local ESX = nil
local stage = 1
local micmuted = false
local OnlinePlayers = 0
local Keys = {

    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,

    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,

    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,

    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,

    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,

    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,

    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,

    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,

    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

}
local voicelevel = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	TriggerEvent('esx:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)

StartShowHudThread()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        SendNUIMessage({
            action = "money",
            id = GetPlayerServerId(PlayerId()),
            playersonline = OnlinePlayers,
        })
    end
end)


RegisterNetEvent("hud:Players")
AddEventHandler("hud:Players", function(players)
    OnlinePlayers = players
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accounts = data.accounts
	for k, v in pairs(accounts) do
		local account = v
		if account.name == "black_money" then
			if account.money > 0 then
			SendNUIMessage({action = "setBlackMoney", black = account.money})
			else
			SendNUIMessage({action = "hideBlackMoney"})
			end
		end
	end
	SendNUIMessage({action = "setVoiceLevel", level = 1})
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "money" then

	SendNUIMessage({action = "setMoney", money = account.money})
	end
	if account.name == "black_money" then
		if account.money > 0 then
		SendNUIMessage({action = "setBlackMoney", black = account.money})
		SendNUIMessage({action = "muted", muted = micmuted})
		else
		SendNUIMessage({action = "hideBlackMoney"})
		end
	end
end)
  -- SendNUIMessage({action = "setVoiceLevel", level = stage})

AddEventHandler('SaltyChat_MicStateChanged', function(isMicrophoneMuted)
	micmuted = isMicrophoneMuted

	if micmuted == false then
		SendNUIMessage({action = "nomuted"})
		SendNUIMessage({action = "setVoiceLevel", level = voicelevel})
		--TriggerEvent('viper_notify', '#005ca8', "SaltyChat", 'Du hast dein Mikrofon stummgeschaltet!')
	end
end)

function StartShowHudThread()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		
		SendNUIMessage({action = "setMoney", money = ESX.GetPlayerData().money})
		SendNUIMessage({action = "muted", muted = micmuted})
	end
end)
end


RegisterNetEvent("adminon")
AddEventHandler('adminon', function()
    SendNUIMessage({action = "adminon"})
end)

RegisterNetEvent("adminoff")
AddEventHandler('adminoff', function()
    SendNUIMessage({action = "adminoff"})
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(e)
	SendNUIMessage({action = "setMoney", money = e})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		ESX.UI.HUD.SetDisplay(0.0)
		if isTalking == false then
			if NetworkIsPlayerTalking(PlayerId()) then
				isTalking = true
				SendNUIMessage({action = "setTalking", value = true})
			end
		else
			if NetworkIsPlayerTalking(PlayerId()) == false then
				isTalking = false
				SendNUIMessage({action = "setTalking", value = false})
			end
		end

	end
end)
  

AddEventHandler("onClientMapStart", function()
	NetworkSetTalkerProximity(voice.default)
	SendNUIMessage({action = "setVoiceLevel", level = 2});
end)
-- colors
local r,g,b,a = 124, 5, 5,255 -- rgba color
--124, 5, 5, 255

-- ranges
local voice = {default = 8.0, shout = 17.0, whisper = 4.0, current = 3}

--- on server startup
AddEventHandler('onClientMapStart', function()
	NetworkSetTalkerProximity(voice.default)
end)

-- main part.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        if IsControlJustPressed(0, Keys['Z']) then
            voice.current = (voice.current + 1) % 3
            if voice.current == 0 then
                NetworkSetTalkerProximity(voice.default)
            elseif voice.current == 1 then
                NetworkSetTalkerProximity(voice.shout)
            elseif voice.current == 2 then
                NetworkSetTalkerProximity(voice.whisper)
            end
        end
        if IsControlPressed(0, Keys['Z']) then
            if voice.current == 0 then
                voiceS = voice.default
            elseif voice.current == 1 then
                voiceS = voice.shout
            elseif voice.current == 2 then
                voiceS = voice.whisper
            end
            Marker(1, coords.x, coords.y, coords.z, voiceS * 2.0)
        end
    end
end)

-- distance to see the circle under people when talking
local playerNamesDist = 10





-- Marker function, don't touch. 
function Marker(type, x, y, z, voiceS)
     DrawMarker(type, x, y, z - 1.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, voiceS, voiceS, 1.0, r, g, b, a, false, true, 2, false, false, false, false)
end



--Speedo
local MPH = true 
local KPH = false
if MPH then
  factor = 3.6
else
  factor = 3.6 
end

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if vehicle and GetPedInVehicleSeat(vehicle, -1) == ped then
				carSpeed = math.ceil(GetEntitySpeed(vehicle) * factor)
				carRPM = GetVehicleCurrentRpm(vehicle)
				SendNUIMessage({
					displayhud = true,
					speed = carSpeed,
					RPM = carRPM,
					KMH = KPH
				})
			else
				SendNUIMessage({
					displayhud = false
				})
				Citizen.Wait(1000)
			end
		else
			SendNUIMessage({
				displayhud = false
			})
			Citizen.Wait(100)
		end
		Citizen.Wait(90)
	end
end)

--Carclear