--local blips = {
	
  Job Blips
  {title="Fraktion: Ballas", colour=27, id=84, x=101.6334, y=-1940.9055, z=20.8037},
  {title="Fraktion: Vagos", colour=46, id=84, x=-1108.11, y=-1621.38, z=4.4},
  {title="Fraktion: Triaden", colour=29, id=436, x = 1369.055, y = 1146.686, z = 113.748},
  {title="Fraktion: ayumi", colour=7, id=84, x= -693.4207,  y=-611.8326, z=32.1430},
  {title="Fraktion: 76er", colour=0, id=84, x= -114.6035,  y=985.2266, z=235.7542}, 
  {title="Fraktion: Aktivistenjäger", colour=40, id=84, x= -311.0135,  y=224.5641, z=87.9139},  
  {title="Fraktion: Midnight", colour=0, id=84, x= -413.2950,  y=-2793.4043, z=6.0004}, 
  {title="Fraktion: Orga", colour=16, id=84, x= -52.3275,  y=354.9491, z=113.0563}, 
  {title="Fraktion: Grove Street", colour=2, id=436, x=1368.5186, y=-578.4211, z=73.8737},
  {title="Fraktion: Die Junckys", colour=47, id=436, x=-824.8073, y=263.7161, z=87.6712},
--}
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 2)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)