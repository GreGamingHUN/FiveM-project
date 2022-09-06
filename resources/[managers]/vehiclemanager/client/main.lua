RegisterNetEvent('createVehicle')
AddEventHandler('createVehicle', function(args)
    CreateVehicle(args[1], args[2], args[3], args[4], 0, true, false)
end)

Citizen.CreateThread(function()
    local speed = 0
    
    
    while true do
        AddTextEntry('FASZ', tostring(math.floor(GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())))))
        speed = 3.6 * GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId()))
        if (IsPedInAnyVehicle(PlayerPedId())) then
            local heading = GetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false))
            local coords = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))
            
            local error = exports.floatydraw:FloatyDraw(coords + vector3(0.1, 0.1, .5), heading ,function(index)
                BeginTextCommandDisplayText('FASZ')
                SetTextFont(4)
                SetTextCentre()
                SetTextOutline()
                SetTextJustification(0)
                SetTextScale(0.9,0.9)
                AddTextComponentSubstringPlayerName('18')
                SetTextColour(100, 100, 255, 255)
                EndTextCommandDisplayText(0.5, 0.3)
            end)
        end
       
        Citizen.Wait(0)
    end
end)