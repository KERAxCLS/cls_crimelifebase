local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback("KERAxCLS:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)



RegisterServerEvent('tc')
AddEventHandler('tc', function(msg)
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('adminnotify2', -1, msg, GetPlayerName(source) .. " | " .. xPlayer.getGroup())
end)



ESX.RegisterServerCallback('Arty:getgroups', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getGroup())
end)

RegisterCommand("ad", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "projektleitung" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "support" or xPlayer.getGroup() == "guide" or xPlayer.getGroup() == "manager" or xPlayer.getGroup() == "sad"then
        TriggerClientEvent('toggleAduty', source)
    else
        TriggerClientEvent('KERAxCLS:notify', -1, "#fff", 'ADMIN', 'Netter Versuch ;)', 15000)

    end
end, false)


