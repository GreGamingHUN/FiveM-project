
local loaded = false

RegisterCommand('loadvehicles', function(source)
    if (not loaded) then
        exports.vehiclemanager:StartUp()
        loaded = true
    else
        TriggerClientEvent('chat:addMessage', source, {'Már el van indítva a jármű manager'})
    end
end)