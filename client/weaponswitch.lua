local lastweapon = ""

CreateThread(function()
    while true do
        Wait(0)
        local weapon = GetSelectedPedWeapon(PlayerPedId())
        if weapon ~= lastweapon then
            lastweapon = weapon
            SetCurrentPedWeapon(PlayerPedId(), weapon, true)
        end
    end
end)


























































--Lucky Crimelife = https://dsc.gg/luckycrimelife
