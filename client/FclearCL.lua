ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand('frakclear', function()
    if ESX.GetPlayerData().job.grade_name == 'boss' then
        TriggerServerEvent('KERAxCLS:frakclear', ESX.GetPlayerData().job.name)
    end
end)