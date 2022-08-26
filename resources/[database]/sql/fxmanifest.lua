fx_version 'cerulean'
game 'gta5'

name "sql"
description "Egy resource ami segít kommunikálni az sql adatbázissal"
author "GreG"
version "0.0.1"

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}
