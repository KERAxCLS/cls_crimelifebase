RegisterCommand("info", function(source)
	_source = source
	xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent("KERAxCLS:notify", source, "#fff", "Frakinfo", "" .. xPlayer.job.label.. " | Rang: " .. xPlayer.job.grade)
	TriggerClientEvent("KERAxCLS:notify", source, "#fff", "Charinfo ", "Group: " ..xPlayer.getGroup().. " | Name: " .. xPlayer.getName())
end)


ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
----------bf400
RegisterServerEvent("KERAxCLS:checkmoney")
AddEventHandler("KERAxCLS:checkmoney", function(money, bike, x, y, z, heading)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerClientEvent('KERAxCLS:spawnVehicle', _source, bike,x, y, z, heading)
	
end)
---------

ESX.RegisterServerCallback("KERAxCLS:getPlayers", function(source, cb)
    cb(GetNumPlayerIndices())
end)
ESX.RegisterServerCallback("KERAxCLS_job", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getJob().label)
end)