local vehicles = { {} }

function GetVehicles()
    return vehicles
end
exports('GetVehicles', getVehicles)


function StartUp()
    print('Starting Vehicle Manager...')
    MySQL.ready(function()
        print('MySQL Connected')
    end)
    
    MySQL.Async.fetchAll('SELECT Count(id) FROM vehicles', {}, function(result)
        for i, v in ipairs(result) do
            for key, value in pairs(v) do
                print('Number of vehicles: ' ..value)
            end
        end
    end)

    MySQL.ready(function()
        MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
            local xd = 0
            local id, x, y, z, rx, ry, rz = -1
            local carname = ''
            for i, v in ipairs(result) do
                print()
                print(i)
                print()
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
                    elseif (key == 'rx') then
                        rx = value
                    elseif (key == 'ry') then
                        ry = value
                    elseif (key == 'rz') then
                        rz = value
                    end
                end
                print(id.. '\t' ..carname.. '\t' ..x.. '\t' ..y.. '\t' ..z)
                local spawned = CreateVehicle(carname, x, y, z, 56.1, true, false)
                SetEntityRotation(spawned, rx, ry, rz, 1, true)
                table.insert(vehicles, {id, spawned})
                if (spawned == nil) then
                    print('miafaszvan')
                else
                    print(spawned)
                end
            end
        end)
    end)
end

exports('StartUp', StartUp)


AddEventHandler('onResourceStop', function(resource)
    if (resource == 'vehiclemanager') then
        print('ez az a resource')
        for id, object in pairs(exports.vehiclemanager:GetVehicles()) do
            local vehiclePos = GetEntityCoords(object[2])
            local vehicleRot = GetEntityRotation(object[2])
            DeleteEntity(object[2])
            MySQL.Async.execute('UPDATE vehicles SET x = @x, y = @y, z = @z, rx = @rx, ry = @ry, rz = @rz WHERE id = @id', {['@x'] = vehiclePos.x, ['@y'] = vehiclePos.y, ['@z'] = vehiclePos.z, ['@rx'] = vehicleRot.x, ['@ry'] = vehicleRot.y, ['@rz'] = vehicleRot.z, ['@id'] = object[1]}, function(result)
                print(result)
            end)
            print('egy kecske')
        end     
    else
        print('miafasz')
    end
end)