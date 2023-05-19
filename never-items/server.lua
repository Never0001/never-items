local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("energydrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('never_items:energydrink', source, item)

end)

QBCore.Functions.CreateUseableItem("adrenalin", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('never_items:adrenalin', source, item)

end)


RegisterNetEvent("never-neveritems:removeitem")
AddEventHandler("never-neveritems:removeitem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
end)