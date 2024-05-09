Citizen.CreateThread(function()
    Wait(5000)
    while true do
        SetDiscordAppId(954829407103635456)
        
        SetDiscordRichPresenceAsset('..')     
        SetDiscordRichPresenceAssetText('...Crimelife')
        
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/")
        
        ESX.TriggerServerCallback('KERAxCLS:getPlayers', function(count)
            ESX.TriggerServerCallback('KERAxCLS_job', function(job)
                if job == "Fraklos" then
                    Citizen.Wait(100)
                    SetRichPresence(GetPlayerName(PlayerId()) .. " | " .. count .. " Spieler Online")
                else
                    Citizen.Wait(100)
                    SetRichPresence(GetPlayerName(PlayerId()) .. " | " .. job .. " | " .. count .. " Spieler Online")
                end
            end)
        end)
        Citizen.Wait(60000)
	end
end)