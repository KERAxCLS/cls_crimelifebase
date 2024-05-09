Citizen.CreateThread(function()
    local dict = "missfbi5ig_21"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(500)
    end
    local handsup = false
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 74) then 
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "hand_up_scientist", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedSecondaryTask(PlayerPedId())
            end
        end
    end
end)
    
