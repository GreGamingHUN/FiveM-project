RegisterNetEvent('createVehicle')
AddEventHandler('createVehicle', function(args)
    CreateVehicle(args[1], args[2], args[3], args[4], 0, true, false)
end)