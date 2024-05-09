AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
     local source = source

     deferrals.defer();
     deferrals.update("Du wirst gerade überprüft Bitte warte einen Moment.");
     
     Citizen.Wait(1500)

     TriggerClientEvent("playerCheck", source)
     deferrals.done()

end)

local webhook = "https://discord.com/api/webhooks/"

function DiscordLog(webhookURL, title, message)

       local embed = {
          {
                 ["color"] = "16711680",
                 ["title"] = title .. "\n",
                 ["description"] = message,
                 ["footer"] = {
                    ["text"] = "AntiExploit System",
               },
          }
      }
  
    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = "Exploit Versuch (Ai ordner)", embeds = embed}), { ['Content-Type'] = 'application/json' })

end

RegisterNetEvent("playerKick")
AddEventHandler("playerKick", function(banned)
     local source = source

     local banned = banned

     if not banned then
          banned = true
          DiscordLog(webhook, "Exploit Versuch", "Der Spieler **"..GetPlayerName(source).."** Hat versucht seine weaponcomponents.meta File zu editieren!")
          Citizen.Wait(50)
	    DropPlayer(source, "Du wurdest gekickt Grund: AI DU LOSER :)")
     end
end)


