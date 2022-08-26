RegisterCommand('send', function(source, args)
    local argString = table.concat(args, ' ')
    MySQL.Async.execute('INSERT INTO fivem (ID, SteamName, data) VALUES (@source, @name, @args)',
    
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@args"] = argString},
        function(result)
            TriggerClientEvent('display', source, "^3" ..argString.. "^0")
    end)
end)