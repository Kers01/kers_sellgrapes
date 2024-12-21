local QBCore = exports['qb-core']:GetCoreObject()

local function SellGrapes(location)
    TriggerServerEvent('kers_üzümsatis:sellGrapes')
end

CreateThread(function()
    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())

        for _, location in ipairs(Config.SellLocations) do
            local dist = #(playerCoords - location)
            if dist < 2.0 then
                sleep = 5
                QBCore.Functions.DrawText3D(location.x, location.y, location.z, "[E] Üzüm Sat")
                if IsControlJustPressed(0, 38) then
                    SellGrapes(location)
                end
            end
        end
        Wait(sleep)
    end
end)
