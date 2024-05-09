Citizen.CreateThread( function()
	while true do
		Citizen.Wait(100)		
		local playerPed = PlayerPedId()
		local playerVeh = GetVehiclePedIsUsing(playerPed)

		if gPlayerVeh ~= 0 then RemovePedHelmet(playerPed,true) end
	end
end)