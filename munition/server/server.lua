ESX = nil

if cfg.settings.useExport and exports[cfg.settings.resource] then
    ESX = exports[cfg.settings.resource]:getSharedObject()
else
    TriggerEvent(cfg.settings.eventName, function(obj) ESX = obj end)
end

RegisterServerEvent('clip:remove')
AddEventHandler('clip:remove', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.removeInventoryItem(cfg.item, 1)
    end
end)

ESX.RegisterUsableItem(cfg.item, function(source)
    TriggerClientEvent('clip:reload', source)
end)
