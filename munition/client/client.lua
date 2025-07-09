ESX = nil

Citizen.CreateThread(function()
    if cfg.settings.useExport and exports[cfg.settings.resource] then
        ESX = exports[cfg.settings.resource]:getSharedObject()
    else
        while ESX == nil do
            TriggerEvent(cfg.settings.eventName, function(obj) ESX = obj end)
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent('clip:reload')
AddEventHandler('clip:reload', function()
    local ped = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(ped)

    if IsPedArmed(ped, 4) and weaponHash ~= nil and weaponHash ~= `WEAPON_UNARMED` then
        TriggerServerEvent('clip:remove')
        AddAmmoToPed(ped, weaponHash, cfg.bullets)
        Notify('success', cfg.messages.reloaded:format(cfg.bullets))
    else
        Notify('error', cfg.messages.noWeapon)
    end
end)
