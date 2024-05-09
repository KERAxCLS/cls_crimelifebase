Citizen.CreateThread(function()
	local coords = vector3(288.9393, -571.8522, 43.1958)
	local coords2 = vector3(278.4215, -607.9623, 43.0293)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z) 
	SetBlipSprite(blip, 0) 
	SetBlipColour(blip, 4) 
	SetBlipAsShortRange(blip, true) 
	BeginTextCommandSetBlipName("STRING") 
	AddTextComponentString("") 
	EndTextCommandSetBlipName(blip) 
	while true do
		Citizen.Wait(0)
		local player = PlayerPedId()
		local playerpos = GetEntityCoords(player)
		if #(coords - playerpos) < 15.0 then
			if IsPedInAnyVehicle(player) then
				DeleteVehicle(GetVehiclePedIsIn(player))
				TriggerEvent("KERAxCLS_hud:notify", "#fff", "ANTIVDM", "VDM voanders aber nicht hier sonst BANN :)")
			end
		end
		if #(coords2 - playerpos) < 15.0 then
			if IsPedInAnyVehicle(player) then
				DeleteVehicle(GetVehiclePedIsIn(player))
				TriggerEvent("KERAxCLS_hud:notify", "#fff", "ANTIVDM", "VDM voanders aber nicht hier sonst BANN :)")
			end
		end
	end
end)