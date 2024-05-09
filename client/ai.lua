local components = {
     "COMPONENT_AT_RAILCOVER_01",
     "COMPONENT_AT_AR_AFGRIP",
     "COMPONENT_AT_PI_FLSH",
     "COMPONENT_AT_AR_FLSH",
     "POLICE_TORCH_FLASHLIGHT",
     "COMPONENT_AT_SCOPE_MACRO",
     "COMPONENT_AT_SCOPE_SMALL",
     "COMPONENT_AT_SCOPE_MEDIUM",
     "COMPONENT_AT_SCOPE_LARGE",
     "COMPONENT_AT_SCOPE_MAX",
     "COMPONENT_AT_PI_SUPP",
     "COMPONENT_AT_AR_SUPP",
     "COMPONENT_AT_AR_SUPP_02",
     "COMPONENT_AT_SR_SUPP",
     "COMPONENT_PISTOL_CLIP_01",
     "COMPONENT_PISTOL_CLIP_02",
     "COMPONENT_COMBATPISTOL_CLIP_01",
     "COMPONENT_COMBATPISTOL_CLIP_02",
     "COMPONENT_APPISTOL_CLIP_01",
     "COMPONENT_APPISTOL_CLIP_02",
     "COMPONENT_MICROSMG_CLIP_01",
     "COMPONENT_MICROSMG_CLIP_02",
     "COMPONENT_SMG_CLIP_01",
     "COMPONENT_SMG_CLIP_02",
     "COMPONENT_ASSAULTRIFLE_CLIP_01",
     "COMPONENT_ASSAULTRIFLE_CLIP_02",
     "COMPONENT_CARBINERIFLE_CLIP_01",
     "COMPONENT_CARBINERIFLE_CLIP_02",
     "COMPONENT_ADVANCEDRIFLE_CLIP_01",
     "COMPONENT_ADVANCEDRIFLE_CLIP_02",
     "COMPONENT_MG_CLIP_01",
     "COMPONENT_MG_CLIP_02",
     "COMPONENT_COMBATMG_CLIP_01",
     "COMPONENT_COMBATMG_CLIP_02",
     "COMPONENT_PUMPSHOTGUN_CLIP_01",
     "COMPONENT_SAWNOFFSHOTGUN_CLIP_01",
     "COMPONENT_ASSAULTSHOTGUN_CLIP_01",
     "COMPONENT_ASSAULTSHOTGUN_CLIP_02",
     "COMPONENT_SNIPERRIFLE_CLIP_01",
     "COMPONENT_HEAVYSNIPER_CLIP_01",
     "COMPONENT_MINIGUN_CLIP_01",
     "COMPONENT_RPG_CLIP_01",
     "COMPONENT_GRENADELAUNCHER_CLIP_01",
     "COMPONENT_PISTOL50_CLIP_01",
     "COMPONENT_PISTOL50_CLIP_02",
     "COMPONENT_ASSAULTSMG_CLIP_01",
     "COMPONENT_ASSAULTSMG_CLIP_02",
     "COMPONENT_BULLPUPSHOTGUN_CLIP_01"
}

local connected = false

AddEventHandler("playerSpawned", function()
     local banned = false
	     if not connected then
               for key, value in pairs(components) do
                    if ( GetWeaponComponentAccuracyModifier(value) >= 1.100001 ) then
                         if not banned then
                              banned = true
                              Citizen.Wait(250)
                              TriggerServerEvent("playerKick", false)
                         end
                    else if ( GetWeaponComponentDamageModifier(value) >= 1.000001 ) then
                         if not banned then
                              banned = true
                              Citizen.Wait(250)
                              TriggerServerEvent("playerKick", false)
                         end
                    end     
               end
          end
		connected = true
	end
end)