local QBCore = exports['qb-core']:GetCoreObject()
--variable
local inUIPage = false

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



--function
local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


--trigger
RegisterNetEvent('investment:client:update', function()
    TriggerServerEvent('investment:server:getdata', 'refresh')
end)

RegisterNetEvent('investment:client:getdata', function(type, table6, today_6, table5, today_5, table4, today_4, table3, today_3, table2, today_2, table1, today_1, table, today, stocks, total)
    --print(stocks, json.encode(stocks))
    SendNUIMessage({
        action = type,
        dataset_6 = table6, 
        label_6 = today_6,
        dataset_5 = table5, 
        label_5 = today_5,
        dataset_4 = table4, 
        label_4 = today_4,
        dataset_3 = table3, 
        label_3 = today_3,
        dataset_2 = table2, 
        label_2 = today_2,
        dataset_1 = table1, 
        label_1 = today_1,
        dataset = table, 
        label = today,
        stocks = stocks,
        total = total
    })
    SetNuiFocus(true, true)
    inUIPage = true
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    inUIPage = false
   
end)

RegisterNUICallback('sale', function(data)
    TriggerServerEvent('investment:server:sale', data)
    Citizen.Wait(500)
    TriggerServerEvent('investment:server:getdata', 'refresh')
   
end)
RegisterNUICallback('buy', function(data)
    TriggerServerEvent('investment:server:buy', data)
    Citizen.Wait(500)
    TriggerServerEvent('investment:server:getdata', 'refresh')
   
end)
--thread

--create Blip--
Citizen.CreateThread(function()
    while not LocalPlayer.state['isLoggedIn'] do
        Wait(5000)
    end
    while true do
        local sleep = 1500
        local pos = GetEntityCoords(PlayerPedId())
        local coordMarker = Config.Blip.coords
        local dist_to_marker = #(pos-coordMarker)
        if dist_to_marker > 1.5 and dist_to_marker <= 25.0 then
            sleep = 0
            DrawText3Ds(coordMarker.x, coordMarker.y, coordMarker.z, '~g~Биржа')
        elseif dist_to_marker <= 1.5 then
            sleep = 0
            DrawText3Ds(coordMarker.x, coordMarker.y, coordMarker.z, '~g~[E] ~w~ Открыть личный кабинет')
            if IsControlJustPressed(0, Keys["E"]) then
                TriggerServerEvent('investment:server:getdata', 'open')
            end
        else
            sleep = 1500
        end
        Citizen.Wait(sleep) 
    end
    
end)


--open UI--
Citizen.CreateThread(function()
    while not LocalPlayer.state['isLoggedIn'] do
        Wait(5000)
    end

    local IRS_Blip = AddBlipForCoord(Config.Blip.coords)
    SetBlipSprite(IRS_Blip, Config.Blip.sprite)
    SetBlipScale(IRS_Blip, Config.Blip.scale)
    SetBlipDisplay(IRS_Blip, Config.Blip.display) 
    SetBlipColour(IRS_Blip, Config.Blip.color)       
    SetBlipAsShortRange(StoreBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Blip.text)
    EndTextCommandSetBlipName(IRS_Blip)
end)