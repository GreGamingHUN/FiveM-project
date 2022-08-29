local vehicles = {}
local vehicleObjects = {}
CreateVehicle('adder', 885.1, -27.6, 78.7, 0, true, false)
MySQL.ready(function()
    MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
        vehicles = result
    end)

    local id, carname, x, y, z
    for i, v in ipairs(vehicles) do
        for key, value in pairs(v) do
            if (key == 'id') then
                id = value
            elseif (key == 'carname') then
                carname = value
            elseif (key == 'x') then
                x = value
            elseif (key == 'y') then
                y = value
            elseif (key == 'z') then
                z = value
            end
        end
        TriggerClientEvent('createVehicle', -1, carname, x, y ,z)
        print('meghivva')
    end
end)

RegisterCommand('sql', function(source, args)
    exports.sql:customSql(args[1])
end, false)

RegisterCommand('listcars', function(source, args)
    for i, v in ipairs(vehicles) do
        print(i..'\t')
        for j, value in pairs(v) do
            print(value..'\t')
        end
        print()
    end
end)