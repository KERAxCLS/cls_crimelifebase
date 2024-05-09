game 'gta5'
author "Kera"
name "cls_crimelifebase"
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
data_file "WEAPONINFO_FILE_PATCH" "meta/weapons_assaultrifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "meta/weaponmachinepistol.meta"
data_file "WEAPONINFO_FILE_PATCH" "meta/weapons_pistol_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "meta/weapons_specialcarbine_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "meta/weapons_carbinerifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "meta/weapons_smg_mk2.meta"

client_scripts {
  '@es_extended/locale.lua',
  "client/*.lua",
  "client.lua",
}

shared_script 'async.lua'
ui_page 'html/html.html'

client_scripts {
  "client/UI/RMenu.lua",
  "client/UI/menu/RageUI.lua",
  "client/UI/menu/Menu.lua",
  "client/UI/menu/MenuController.lua",
  "client/UI/components/*.lua",
  "client/UI/menu/elements/*.lua",
  "client/UI/menu/items/*.lua",
  "client/UI/menu/panels/*.lua",
  "client/UI/menu/windows/*.lua",
  "mapmanager/mapmanager_shared.lua",
  "mapmanager/mapmanager_client.lua",
  'spawnmanager/spawnmanager.lua'
}

files {
    'handling.meta',
	'html/html.html',
	'html/*.js',
	'html/*.svg',
	'html/*.ttf',
	'html/*.png',
	'html/*.css'
  'weapons.meta',
  "weapons/*.meta",
  
}

client_scripts {
	'client.lua',
	'client/*.lua',
    	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua'
}

server_scripts {
    	"@mysql-async/lib/MySQL.lua",
  	"server.lua",
  	"server/*.lua",
  	'server/classes/addonaccount.lua',
  	"mapmanager_shared.lua",
    	"mapmanager_server.lua"
}

server_scripts { '@mysql-async/lib/MySQL.lua' }

data_file 'WEAPONINFO_FILE_PATCH' 'weapons.meta'
data_file 'HANDLING_FILE'         'handling.meta'