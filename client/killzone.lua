function ss(msg)  CurrentActionMsg  = msg SetTextComponentFormat('STRING')  AddTextComponentString(CurrentActionMsg) DisplayHelpTextFromStringLabel(0, 0, 1, -1) end
Citizen.CreateThread(function() while ESX == nil do	Citizen.Wait(0) TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) end end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        as  = false
        local pc = GetEntityCoords(PlayerPedId())
        local de = Vdist(pc, KERAxCLS.coords.x, KERAxCLS.coords.y, KERAxCLS.coords.z)
        if de < 20.0 then
                DrawMarker(21, KERAxCLS.coords.x, KERAxCLS.coords.y, KERAxCLS.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, KERAxCLS.marker.r, KERAxCLS.marker.g, KERAxCLS.marker.b, 80, 0, 0, 0, 3)
                as  = true
        end
        if de < 1.6 then
            ss('Drücke E um in die Killzone zu gelangen')
            as  = true
            if IsControlJustReleased(0, 38) then
                SetEntityCoordsNoOffset(PlayerPedId(), KERAxCLS.killzone.respawns[math.random(#KERAxCLS.killzone.respawns)], true, true, true)
            end
        end
        if not as then
            Citizen.Wait(2000)
            end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        ass  = false
        inzone  = false
        local pc = GetEntityCoords(PlayerPedId())
        local aaaaa = Vdist(pc, KERAxCLS.killzone['coords'])
        if aaaaa < 150.0 then
                DrawMarker(28, KERAxCLS.killzone['coords'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, KERAxCLS.killzonesize.x, KERAxCLS.killzonesize.y, KERAxCLS.killzonesize.z, KERAxCLS.marker.r, KERAxCLS.marker.g, KERAxCLS.marker.b, 80, 0, 0, 0, 0)
                ass  = true
        end
        if aaaaa < KERAxCLS.killzonesize.x then
            inzone  = true
        end
        if not ass then
            Citizen.Wait(2000)
            end
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data) if inzone then Citizen.Wait(KERAxCLS.killzone['respawntime'] *1000) SetEntityCoordsNoOffset(PlayerPedId(), KERAxCLS.killzone.respawns[math.random(#KERAxCLS.killzone.respawns)], true, true, true) Citizen.Wait(200) TriggerEvent(KERAxCLS.killzone['revtrigger']) end end)
