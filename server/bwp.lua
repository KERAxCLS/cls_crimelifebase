ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

sended = false

RegisterServerEvent("clsclanlol")
AddEventHandler("clsclanlol", function(frakname)
    if sended then
        TriggerClientEvent('KERAxCLS_hud:notify', -1, "Die Fraktion " .. frakname .. " hat nun offene Bewerbungsphase! - 15 Minuten Savezone!", 10000, "white", "glob")
    else
        sended = true
		TriggerClientEvent('KERAxCLS_broadcast:display', -1, "Die Fraktion " .. frakname .. " hat nun offene Bewerbungsphase! - 15 Minuten Savezone!", 10000, "white", "glob")
    end
end)


---------------onlist---------
TriggerEvent('es:addCommand', 'status', function(source, args, user)
        TriggerClientEvent("KERAxCLS_hud:notify", source, "#fff", "KERAxCLS system", "Es sind gerade   " .. GetNumPlayerIndices() .. " Spieler Online")
end)