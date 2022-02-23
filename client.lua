local QBCore = exports['qb-core']:GetCoreObject()
--variable
local inUIPage = false
local inDialog = false
local Data = {

}
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

local function PedCreate()
    RequestModel(GetHashKey(Config.black_broker_ped))
    while not HasModelLoaded(GetHashKey(Config.black_broker_ped)) do
       Wait(1)
    end
  
    RequestAnimDict("mini@strip_club@idles@bouncer@base")
    while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
       Wait(1)
    end
    local ped =  CreatePed(4,Config.black_broker_ped,Config.black_broker_coords.x,Config.black_broker_coords.y,Config.black_broker_coords.z-1, 3374176, false, true)
    SetEntityHeading(ped, Config.black_broker_coords.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end

local function OnHackDone(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        --TriggerServerEvent('qb-bankrobbery:server:setBankState', closestBank, true
        print('done!!!', json.encode(Data))
        TriggerServerEvent('investment:server:HackStocksCurs', Data)
       
    else
		TriggerEvent('mhacking:hide')
	end
end
--trigger
RegisterNetEvent('investment:client:update', function()
    TriggerServerEvent('investment:server:getdata', 'refresh')
end)

RegisterNetEvent('investment:client:UseTablet', function()
    local chart_labels = {
        [1] = {company = 'Сеть магазинов 24/7', price = 15000, percent = 75},
        [2] = {company = 'Lifeinvader', price = 50000, percent = 65},
        [3] = {company = 'Rogers Salvage&Scrap', price = 250000, percent = 55},
        [4] = {company = 'Grand Banks Steel Inc Foundry', price = 350000, percent = 50},
        [5] = {company = 'Humane Labs and Research', price = 500000, percent = 45},
    }

    local investmentMenu = {
        {
            header = '👽 Анонимус',
            isMenuHeader = true
        }
        
    }
    for i, v in pairs(chart_labels) do
        investmentMenu[#investmentMenu+1] = {
            header = v.company,
            txt = "Стоимость взлома: $" ..v.price.. "<br>Понижение курса на "..v.percent.."%",
            params = {
                event = "investment:client:HackStocksCurs",
                args = {
                    company = v.company,
                    price = v.price,
                    percent = v.percent,
                    
                }
            }
        }
    end
    investmentMenu[#investmentMenu+1] = {
        header = 'Закрыть меню',
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(investmentMenu)

   
end)
RegisterNetEvent('investment:client:HackStocksCurs', function(data)
     QBCore.Functions.Progressbar("trojanRob_usb", "Подключаемся..", 15000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        --TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["trojanRob_usb"], "remove")
        Data = data
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", math.random(6, 7), math.random(12, 15), OnHackDone)      
    end)
    
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

RegisterNetEvent('investment:client:UIForceClose', function()
    if inUIPage then
        SendNUIMessage({
            action = 'close',
          
        })
        SetNuiFocus(false, false)
        inUIPage = false
    end
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
            --sleep = 1500
        end

        local coordBroker = Config.black_broker_coords
        local Player = QBCore.Functions.GetPlayerData()
        local dist_to_broker = #(vector3(coordBroker.x, coordBroker.y, coordBroker.z)-pos)
        if dist_to_broker > 1.5 and dist_to_broker <= 25.0 then
            sleep = 0
            DrawText3Ds(coordBroker.x, coordBroker.y, coordBroker.z, '~g~Черный Брокер')
        elseif dist_to_broker <= 1.5 and not inDialog then
            sleep = 0
            DrawText3Ds(coordBroker.x, coordBroker.y, coordBroker.z, '~g~[E] ~w~ для взаимодействия')
            if IsControlJustPressed(0, Keys["E"]) then
                --TriggerServerEvent('investment:server:getdata', 'open')
                --QBCore.Functions.Notify('Шо тоби треба?') 
                TriggerEvent("chatMessage", "Брокер", "normal", 'Привет, '..Player.charinfo.firstname..'! Слышал ты интресуешься акциями, надеюсь ты "Медведя" от "Быка" оличаешь.')
                inDialog = true
            end
        elseif  dist_to_broker <= 1.5 and inDialog then
            sleep = 0
            DrawText3Ds(coordBroker.x, coordBroker.y, coordBroker.z, '~g~[E] ~w~ продолжить/~r~[G] ~w~ прекратить')
            if IsControlJustPressed(0, Keys["E"]) then
                --TriggerServerEvent('investment:server:getdata', 'open')
                --QBCore.Functions.Notify('Шо тоби треба?') 
                if Player.charinfo.gender == 0 then
                    TriggerEvent("chatMessage", "Брокер", "normal", 'Возьми вот эту штуку, ее изготовили "Анонимус", слыхал? Как работает, думаю, разберешься, судя по всему ты не глупый парень...')
                else
                    TriggerEvent("chatMessage", "Брокер", "normal", 'Возьми вот эту штуку, ее изготовили "Анонимус", слыхала? Как работает, думаю, разберешься, судя по всему ты не глупая девка...')

                end
                TriggerServerEvent('investment:server:getTablet')
                inDialog = false
            end
            if IsControlJustPressed(0, Keys["G"]) then
                --TriggerServerEvent('investment:server:getdata', 'open')
                --QBCore.Functions.Notify('Шо тоби треба?') 
                TriggerEvent("chatMessage", "Брокер", "normal", 'Так и знал, что кишка у тебя тонка для этого дела')
                inDialog = false
            end
        else
            --sleep = 1500
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
    PedCreate()
end)