cfg = {}

cfg.settings = {
    useExport = false,
    resource = "es_extended",
    eventName = "esx:getSharedObject"
}

cfg.item = "clip"
cfg.bullets = 60

cfg.messages = {
    noWeapon = "Du hast keine Waffe in deiner Hand",
    reloaded = "Du hast %s Schuss nachgeladen!"
}

function Notify(type, msg)
    --TriggerEvent("esx:showNotification", msg)
    TriggerEvent("ws_notify", type, "Information", msg, 5000)
end
