ESX = nil
sended = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("bwp", function()
        if ESX.GetPlayerData().job.label == "Unemployed" then
            TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'BewerbungsPhase', 'Dazu hast du leider keine Rechte !', 15000)
        else
		if ESX.GetPlayerData().job.grade_name == 'boss' then
		TriggerServerEvent("clsclanlol", ESX.GetPlayerData().job.label)
        sended = true
		else
			TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'BewerbungsPhase', 'Du bist nicht der Inviter !', 15000)
		end
	end
end)