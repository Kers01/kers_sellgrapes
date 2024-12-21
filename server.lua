local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kers_üzümsatis:sellGrapes', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local grapeCount = Player.Functions.GetItemByName('uzum') and Player.Functions.GetItemByName('uzum').amount or 0
        if grapeCount > 0 then
            local totalPrice = grapeCount * Config.GrapePrice
            Player.Functions.RemoveItem('uzum', grapeCount)
            Player.Functions.AddMoney('cash', totalPrice)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['uzum'], 'remove')
            TriggerClientEvent('QBCore:Notify', src, "Üzümleri sattın ve " .. totalPrice .. "$ kazandın!", "success")
        else
            TriggerClientEvent('QBCore:Notify', src, "Üzerinde üzüm yok!", "error")
        end
    end
end)
