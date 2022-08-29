fx_version 'cerulean'
game 'gta5'

name "vehiclemanager"
description "Járművek kezelésére szolgáló resource"
author "GreG"
version "0.0.1"

shared_scripts {
	'@sql/server/main.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua', 
	'server/*.lua'
}
