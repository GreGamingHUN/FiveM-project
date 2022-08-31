RegisterNetEvent('addVehicle', function(source, vehname, x, y, z)
    exports.sql:addVehicle(source, vehname, x, y, z)
end)

RegisterCommand('auto2', function(source, args)
    local vehicleName = args[1] or 'adder'

    local playerPed = GetPlayerPed(source)
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)

    TriggerClientEvent('chat:addMessage', source, {
        args = {'ugyes vagy, ' ..vehicleName.. ' spawnolása'}
    })

    TriggerEvent('addVehicle', source, vehicleName, pos.x, pos.y, pos.z)
end, false)

RegisterCommand('vehcolor', function(source, args)
    local color = args[1] or '1'
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
    TriggerClientEvent('chat:addMessage', source, {
        args = {vehicle.. 'átfestése ' ..color.. ' számú színre'}
    })
    SetVehicleColours(vehicle, color, color)
end)
--ez fos xddddddddddddddd