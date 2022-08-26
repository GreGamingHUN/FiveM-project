RegisterNetEvent('display')
AddEventHandler('display', function(args)
    TriggerEvent('chat:addMessage', 'Fasz', {0, 0, 255}, args)
end)