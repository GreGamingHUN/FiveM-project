local spawnPos = vector3(893.245, -40.950, 78.461)



local marker = true
AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_m_skater_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'Welcome to the party!~' }
            })
        end)
    end)

    marker = true
    while true do
        Wait(0)
        if marker then
            local pedCoords = GetEntityCoords(PlayerPedId())
            DrawMarker(2, pedCoords.x, pedCoords.y, pedCoords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
        end
    end

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

RegisterCommand('auto', function(source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelAVehicle(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'nagy buta szappan vagy, ' ..vehicleName.. ' nevű autó kurvára nincs'}
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)

    SetModelAsNoLongerNeeded(vehicleName)

    TriggerServerEvent('addVehicle', playerPed, vehicleName, pos.x, pos.y, pos.z)

    TriggerEvent('chat:addMessage', {
        args = {'ugyes vagy, ' ..vehicleName.. 'spawnolása'}
    })
end, false)

local globalVehicle

RegisterCommand('lezar', function(source, args)
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(playerPed, false) then
        TriggerEvent('chat:addMessage', {
            args = {'Nem ulsz kocsiban retard'}
        })
        return
    end
    globalVehicle = GetVehiclePedIsUsing(playerPed)
    SetVehicleDoorsLocked(globalVehicle, 2)
    TriggerEvent('chat:addMessage', {
        args = {'Kocsi lezarva'}
    })
end, false)

RegisterCommand('kinyit', function(source, args)
    SetVehicleDoorsLocked(globalVehicle, 0)
end, false)

RegisterCommand('pos', function(source, args)
    local playerPos = GetEntityCoords(PlayerPedId())
    TriggerEvent('chat:addMessage', {
        args = {'Jelenlegi poziciod: ' ..playerPos.x.. ', ' ..playerPos.y.. ', ' ..playerPos.z }
    })
end, false)

RegisterCommand('tp', function(source, args)
    TriggerEvent('chat:addMessage', {
        args = {'Teleportalas ide: ' ..args[1].. ' ' ..args[2].. ' ' ..args[3]}
    })

    local player = PlayerPedId()
    SetEntityCoords(player, args[1], args[2], args[3], true, false, false, false)
end, false)

RegisterCommand('addselfmarker', function(source, args)
    marker = true
    while true do
        Wait(0)
        if marker then
            local pedCoords = GetEntityCoords(PlayerPedId())
            DrawMarker(1, pedCoords.x, pedCoords.y, pedCoords.z + 2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
        end
    end
end, false)

RegisterCommand('addmarker', function(source, args)
    local pos = GetEntityCoords(PlayerPedId())
    while true do
        Wait(0)
        DrawMarker(1, pos.x, pos.y, pos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
    end
end, false)

RegisterCommand('delmarker', function(source, args)
    if marker then
        marker = nil
    else
        TriggerEvent('chat:addMessage', {
            args = {marker}
        })
    end
end, false)

RegisterCommand('heal', function(source, args)
    local player = GetPlayerPed()
    SetEntityHealth(player, 200)
end, false)

local blip
local blipArray = {}

RegisterCommand('addblip', function(source, args)
    if args[1] == 'pos' then
        local pos = GetEntityCoords(PlayerPedId())
        blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        return
    end
    blip = AddBlipForCoord(155.0, 155.0, 155.0)
end, false)

RegisterCommand('delblip', function(source, args)
    RemoveBlip(blip)
end, false)

RegisterCommand('tp', function(source, args)
    SetEntityCoords(PlayerPedId(), args[1], args[2], args[3])
end)

RegisterCommand('del', function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
end)