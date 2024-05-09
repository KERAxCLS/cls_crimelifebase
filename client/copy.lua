--================================--
--          Copy Fit v1           --
--          by JellyJam           --
--      License: GNU GPL 3.0      --
--================================--

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

RegisterNetEvent("getOutfit")
AddEventHandler("getOutfit", function(playerToGiveOutfit)
local ped1 = PlayerPedId()
local outfit = {}
for i=1,11 do
local drawable, texture, palette = GetPedDrawableVariation(ped1, i), GetPedTextureVariation(ped1, i), GetPedPaletteVariation(ped1, i)
table.insert(outfit, {drawable = drawable, texture = texture, palette = palette})
end -- Get Ped Drawables
TriggerServerEvent("sendToServer", outfit, playerToGiveOutfit)
end)

RegisterNetEvent("setPed")
AddEventHandler("setPed", function(outfit)
local ped2 = PlayerPedId()
for k,v in pairs(outfit) do
     SetPedComponentVariation(ped2, k, v.drawable, v.texture, v.palette)
end-- Set Ped Components
end)
