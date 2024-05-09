ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
    Citizen.Wait(0)
  end

  ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

RegisterCommand('boss', function()

  if ESX.PlayerData.job.grade_name == 'boss' then
    Bossmenu()
  else
    TriggerClientEvent('KERAxCLS_hud:notify', -1, "#fff", 'Lucky System', 'Dazu hast du leider keine Rechte!', 15000)
  end

end)

function Bossmenu() 

  local society = ESX.PlayerData.job.name
  local elements = {
    {label = 'Member Verwalten',		value = 'membermenu'}, 
    {label = 'Bewerbungsphase',		value = 'bwp'},   
    {label = 'Frakclear',		value = 'clear'},						          
  }

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Rollengamingbossmenu',
    {
      title    = 'Boss Menu',
      align    = 'top-left',
      elements = elements
      },

          function(data2, menu2)

            if data2.current.value == 'membermenu' then
              TriggerEvent('esx_society:openBossMenu', society, function (data, menu)
                menu.close()
              end, {wash = false, withdraw = false, deposit = false, grades = false})
            elseif data2.current.value == 'bwp' then

              ExecuteCommand("bwp")

            elseif data2.current.value == 'clear' then
              
              ExecuteCommand("frakclear")
              
            end
          end,
    function(data2, menu2)
      menu2.close()
    end)
end


RegisterKeyMapping('boss', 'Bossmenu öffnen', 'keyboard', 'F4')



