local QBCore = exports['qb-core']:GetCoreObject()

local adrenalintime , energydrinktime = 0,0

RegisterNetEvent("never_items:energydrink", function()
    local gameTime = GetGameTimer()
    local ped = PlayerPedId()
 if  energydrinktime == 0 or gameTime > energydrinktime then
    QBCore.Functions.Progressbar("adrenalin", "Enerji İçeceği Kullanıyorsun ", 3000, false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
    disableMovement = false,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
},{
}, {}, {}, function()
    ExecuteCommand("e c")
    energydrinktime = gameTime + 60000 -- timeout süresi
    TriggerServerEvent("never-neveritems:removeitem","energydrink")
    while true do
    SetRunSprintMultiplierForPlayer(PlayerId(),1.25)
    Citizen.Wait(15000)   --- Kaç saniye hızlı koşmasını ayarlar
    SetRunSprintMultiplierForPlayer(PlayerId(),1.05)
    break
    end
end)
    else 
        QBCore.Functions.Notify("Tekrar Kullanmak İçin Bekle", 'error')
    end
end)

RegisterNetEvent("never_items:adrenalin", function()
    local gameTime = GetGameTimer()
    local ped = PlayerPedId()
    local armour = GetPedArmour(ped)
    if  adrenalintime == 0 or gameTime > adrenalintime then
        ExecuteCommand("e drink")
        QBCore.Functions.Progressbar("adrenalin", "Adrenalin Kullanıyorsun", 3000, false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    },{
    }, {}, {}, function()
        ExecuteCommand("e c")
        adrenalintime = gameTime + 60000
        TriggerServerEvent("never-neveritems:removeitem","adrenalin")
        armor()
end)
    else
        QBCore.Functions.Notify('Tekrar Kullanmak İçin Bekle', 'error')
    end
end)

   function armor()
    for i=1, 5 do 
        local health = GetEntityHealth(PlayerPedId()) -- Karakterin/arabanın can değerini çeker
        AddArmourToPed(PlayerPedId(),5)            -- Kaç Zırh ekliyeceği
        SetEntityHealth(PlayerPedId(), health + 5) -- Kaç Can ekliyeceği
        Citizen.Wait(3000)
    end
end 
