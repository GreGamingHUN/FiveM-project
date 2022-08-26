fx_version 'cerulean'
game 'gta5'

name "first"
description "My first resource"
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
	'server/*.lua'
}

files {
	"html/*"
}