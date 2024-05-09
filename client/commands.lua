funkan = false

RegisterCommand("funk", function()
    ESX.PlayerData = ESX.GetPlayerData()
    TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'FUNK SYSTEM', 'Drücke zum FUNKEN: CapsLock!', 15000)
    funkan = true
end)



Citizen.CreateThread(function()


    RequestAnimDict( "random@arrests" )
    while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
            Wait( 100 )
    end
    while true do
        Citizen.Wait(0)

        if funkan then
            if IsControlJustPressed(1, 137) then
                TaskPlayAnim(PlayerPedId(), "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
            end
            if IsControlJustReleased(1, 137) then
                ClearPedSecondaryTask(PlayerPedId())
            end 
    end
end
end)