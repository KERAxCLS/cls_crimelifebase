ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('KERAxCLS:frakclear')
AddEventHandler('KERAxCLS:frakclear', function(job)
    local xPlayers = ESX.GetExtendedPlayers("job", job)
    for _, xPlayer in pairs(xPlayers) do
        xPlayer.setJob('unemployed', 0)
        TriggerClientEvent('KERAxCLS_hud:notify', job, '#fff', 'KERAxCLS system', 'DEINE FRAKTION WURDE GECLEART')
    end
end)