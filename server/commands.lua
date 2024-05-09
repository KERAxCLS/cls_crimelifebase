ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)



--	RegisterCommand('info', function(source,args)
--		local xPlayer = ESX.GetPlayerFromId(source)
--		if xPlayer.getGroup() == 'admin' or 'projektleitung' or 'mod' or 'support'  or 'guide' or 'superadmin' or 'dev' then
--		  local xTarget = ESX.GetPlayerFromId(args[1])
--		  TriggerClientEvent('notifications', source, 'orange', 'ADMIN', 'ID: '.. args[1] ..' |  Steam: '.. GetPlayerName(args[1]) .. ' !') 
--		  TriggerClientEvent('notifications', source, 'orange', 'ADMIN', ' Job: '.. xTarget.job.label .. ' | Group:  '.. firstToUpper(xTarget.getGroup())..' !')
--		  
--		else
--			TriggerClientEvent("notifications", source, "red", "FrakSystem", "Du hast deine Fraktion verlassen")
--		end
--	end)
				
RegisterCommand("myinfo", function(source)
	_source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("KERAxCLS_hud:notify", source, "#fff", "KERAxCLS system", "Steam: " .. GetPlayerName(source) .. " | ID: ".. source .. " | Group: ".. firstToUpper(xPlayer.getGroup()).."")
end)


RegisterCommand("frak", function(source)
	_source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent("KERAxCLS_hud:notify", source, "#fff", "KERAxCLS system", "Fraktion: " .. xPlayer.job.label .. " | Rang: " .. xPlayer.job.grade)
end)

RegisterCommand("online", function(source, args, user)
        TriggerClientEvent("KERAxCLS_hud:notify", source, "#fff", "KERAxCLS system", "Es sind gerade  " .. GetNumPlayerIndices() .. " Spieler Online !")
end)





RegisterCommand("frakleave", function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('unemployed', 0) 
	Citizen.Wait(100)
	TriggerClientEvent("KERAxCLS_hud:notify", source, "#fff", "KERAxCLS system", "Du hast deine Fraktion verlassen")
end)

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--Frak
RegisterCommand('giveskin', function(source,args)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getJob().grade >= 10 then
    local xTarget = ESX.GetPlayerFromId(args[1])
    TriggerClientEvent('KERAxCLS_hud:notify', xPlayer.source, '#fff', 'ADMIN', 'Du hast '.. xTarget.getName() .. ' das Skin Menu geöffnet!') 
    TriggerClientEvent('KERAxCLS_hud:notify', xTarget.source, '#fff', 'ADMIN', 'Dir wurde das Skin Menu von ' .. GetPlayerName(source) .. ' | ID:'  .. source .. ' geöffnet!')
    TriggerClientEvent('esx_skin:openSaveableMenu', args[1]) 
end

end)