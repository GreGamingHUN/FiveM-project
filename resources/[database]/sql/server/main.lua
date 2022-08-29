RegisterCommand('send', function(source, args)
    local argString = table.concat(args, ' ')
    MySQL.Async.execute('INSERT INTO fivem (ID, SteamName, data) VALUES (@source, @name, @args)',
    
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@args"] = argString},
        function(result)
            TriggerClientEvent('display', source, "^3" ..argString.. "^0")
    end)
end)

function addVehicle(source, carname, x, y, z)
    MySQL.Async.execute('INSERT INTO vehicles (carname, x, y, z) VALUES (@car, @x, @y ,@z)',
    {['@car'] = carname, ['@x'] = x, ['@y'] = y, ['@z'] = z}, 
    function(result)
        TriggerClientEvent('chatMessage', source)
    end)
end
exports('addVehicle', addVehicle)

function customSql(query)
    MySQL.Async.fetchAll(query, {}, function(result)
    end)
end
exports('customSql', customSql)