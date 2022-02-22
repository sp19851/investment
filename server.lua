local QBCore = exports['qb-core']:GetCoreObject()


local function investment_server_setdata()
    print('investment table updating...')
    local _247 = math.random(-100,150)
    local Lifeinvader = math.random(-200, 250)
    local Rogers = math.random(-500, 555)
    local Foundry = math.random(-700, 850)
    local HumaneLabs = math.random(-1500,2500)
   
    --property--
    --247--
    local now = os.time()
    local curs = exports.oxmysql:fetchSync('SELECT lastupdate, curs FROM `investment` where company = ?', {'Сеть магазинов 24/7'})
    print('timmmm',(os.time()-curs[1].lastupdate), Config.investmentPeriod, os.date('%x', curs[1].lastupdate))
    if (curs[1]~= nil and curs[1].lastupdate ~= nil) and (os.time()-curs[1].lastupdate > Config.investmentPeriod) then
        if curs[1]~= nil and curs[1].curs ~= nil  then 
           exports.oxmysql:execute('insert into investment (company, curs, lastupdate) values (?, ?, ?) ON DUPLICATE KEY UPDATE company = ?,  curs = ?, lastupdate = ?', 
           {'Сеть магазинов 24/7', curs[1].curs+_247, os.time(), 'Сеть магазинов 24/7', curs[1].curs+_247, os.time()}) 
           exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Сеть магазинов 24/7', curs[1].curs+_247, os.time(), os.date("%x", os.time())})
        else
           exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Сеть магазинов 24/7', _247, os.time(), os.date("%x", os.time())})
        end
    end
    Citizen.Wait(500)
   
    local curs = exports.oxmysql:fetchSync('SELECT lastupdate, curs FROM `investment` where company = ?', {'Lifeinvader'})
    if (curs[1]~= nil and curs[1].lastupdate ~= nil) and (os.time()-curs[1].lastupdate > Config.investmentPeriod) then
        if curs[1]~= nil and curs[1].curs ~= nil  then 
           exports.oxmysql:execute('insert into investment (company, curs, lastupdate) values (?, ?, ?) ON DUPLICATE KEY UPDATE company = ?,  curs = ?, lastupdate = ?', 
           {'Lifeinvader', curs[1].curs+_247, os.time(), 'Lifeinvader', curs[1].curs+Lifeinvader, os.time()}) 
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Lifeinvader', curs[1].curs+Lifeinvader, os.time(), os.date("%x", os.time())})
        else
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Lifeinvader', Lifeinvader, os.time(), os.date("%x", os.time())})
        end
    end
    Citizen.Wait(500)

    local curs = exports.oxmysql:fetchSync('SELECT lastupdate, curs FROM `investment` where company = ?', {'Rogers Salvage&Scrap'})
    if (curs[1]~= nil and curs[1].lastupdate ~= nil) and (os.time()-curs[1].lastupdate > Config.investmentPeriod) then
        if curs[1]~= nil and curs[1].curs ~= nil  then 
           exports.oxmysql:execute('insert into investment (company, curs, lastupdate) values (?, ?, ?) ON DUPLICATE KEY UPDATE company = ?,  curs = ?, lastupdate = ?', 
           {'Rogers Salvage&Scrap', curs[1].curs+Rogers, os.time(), 'Rogers Salvage&Scrap', curs[1].curs+Rogers, os.time()}) 
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Rogers Salvage&Scrap', curs[1].curs+Rogers, os.time(), os.date("%x", os.time())})
        else
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Rogers Salvage&Scrap', Rogers, os.time(), os.date("%x", os.time())})
        end
    end
    Citizen.Wait(500)

    local curs = exports.oxmysql:fetchSync('SELECT lastupdate, curs FROM `investment` where company = ?', {'Grand Banks Steel Inc Foundry'})
    if (curs[1]~= nil and curs[1].lastupdate ~= nil) and (os.time()-curs[1].lastupdate > Config.investmentPeriod) then
        if curs[1]~= nil and curs[1].curs ~= nil  then 
           exports.oxmysql:execute('insert into investment (company, curs, lastupdate) values (?, ?, ?) ON DUPLICATE KEY UPDATE company = ?,  curs = ?, lastupdate = ?', 
           {'Grand Banks Steel Inc Foundry', curs[1].curs+Foundry, os.time(), 'Grand Banks Steel Inc Foundry', curs[1].curs+Foundry, os.time()}) 
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Grand Banks Steel Inc Foundry', curs[1].curs+Foundry, os.time(), os.date("%x", os.time())})
        else
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Grand Banks Steel Inc Foundry', Foundry, os.time(), os.date("%x", os.time())})
        end
    end
    Citizen.Wait(500)

    local curs = exports.oxmysql:fetchSync('SELECT lastupdate, curs FROM `investment` where company = ?', {'Humane Labs and Research'})
    if (curs[1]~= nil and curs[1].lastupdate ~= nil) and (os.time()-curs[1].lastupdate > Config.investmentPeriod) then
        if curs[1]~= nil and curs[1].curs ~= nil  then 
           exports.oxmysql:execute('insert into investment (company, curs, lastupdate) values (?, ?, ?) ON DUPLICATE KEY UPDATE company = ?,  curs = ?, lastupdate = ?', 
           {'Humane Labs and Research', curs[1].curs+HumaneLabs, os.time(), 'Humane Labs and Research', curs[1].curs+HumaneLabs, os.time()}) 
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Humane Labs and Research', curs[1].curs+HumaneLabs, os.time(), os.date("%x", os.time())})
        else
            exports.oxmysql:execute('insert into investments (company, curs, date, datelabel) values (?, ?, ?, ?)', {'Humane Labs and Research', HumaneLabs, os.time(), os.date("%x", os.time())})
        end
    end
    Citizen.Wait(500)
    TriggerClientEvent('investment:client:update', -1)
end

local function investment_server_getdata(src, type)
    local Player = QBCore.Functions.GetPlayer(src)
    local TotalTax = 0 
    --property--
    --house--
    local today = os.date('%x', os.time())
    local today_1 = os.date('%x', os.time()-24*60*60)
    local today_2 = os.date('%x', os.time()-48*60*60)
    local today_3 = os.date('%x', os.time()-72*60*60)
    local today_4 = os.date('%x', os.time()-96*60*60)
    local today_5 = os.date('%x', os.time()-120*60*60)
    local today_6 = os.date('%x', os.time()-144*60*60)
   
    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_6})
    local table6 = {}
    -- chart_labels : ['Сеть магазинов 24/7', 'Lifeinvader', 'Rogers Salvage&Scrap', 'Grand Banks Steel Inc Foundry', 'Humane Labs and Research'],

    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table6[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                    table6[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table6[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table6[4] = v.curs
            else
                table6[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_5})
    local table5 = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table5[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table5[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table5[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table5[4] = v.curs
            else
                table5[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_4})
    local table4 = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table4[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table4[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table4[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table4[4] = v.curs
            else
                table4[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_3})
    local table3 = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table3[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table3[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table3[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table3[4] = v.curs
            else
                table3[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_2})
    local table2 = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table2[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table2[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table2[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table2[4] = v.curs
            else
                table2[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today_1})
    local table1 = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table1[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table1[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table1[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table1[4] = v.curs
            else
                table1[5] = v.curs
            end
        end
    end

    local result = exports.oxmysql:fetchSync('SELECT * FROM `investments` where datelabel = ? LIMIT 7', {today})
    local table = {}
    
    if result ~= nil then
        for i, v in pairs(result) do
            if v.company == 'Сеть магазинов 24/7' then
                table[1] = v.curs
            elseif v.company == 'Lifeinvader' then
                table[2] = v.curs
            elseif v.company == 'Rogers Salvage&Scrap' then
                table[3] = v.curs
            elseif v.company == 'Grand Banks Steel Inc Foundry' then
                table[4] = v.curs
            else
                table[5] = v.curs
            end
        end
    end




    --[[local _247 = exports.oxmysql:fetchSync('SELECT * FROM `investment` where company = ? order by id desc LIMIT 7', {'Сеть магазинов 24/7'})
    local _247data = {}
    local tempdataset = {}
    local templabel = {}
    for i, v in pairs(_247) do
        --print(i, '-', json.encode(v))
        --print(os.time(v.date))
        local d = os.date('%x',  math.ceil(v.date))
        --print(math.ceil(v.date), d,  os.date('%x', math.ceil(v.date)))
        templabel[i] = {os.date('%x',v.date)}
        tempdataset[i] = {v.curs}
    end
    
   ]]
   --{name: "Сеть магазинов 24/7", curs: 5000, amount: 0, freeamount: 900, totalamount: 1000, forsale:0, forbuy:0},

    local stocks  = {}
    local total = 0
    local result2 =  exports.oxmysql:fetchSync('SELECT * FROM investment')
  
    if result2 ~= nil then 
        for i,v in pairs(result2) do
            print(i, json.encode(v))
            local result =  exports.oxmysql:fetchSync('SELECT * FROM players_stocks where citizenid = ? and company = ?', {Player.PlayerData.citizenid, v.company})
            local curs = 0
            local free_amount = 0
            local all_amount = 0
            local amount = 0
            if v.curs ~= nil then curs = v.curs end
            free_amount = v.free_amount
            all_amount = v.all_amount
            if result[1] ~= nil then 
                if result[1].amount ~= nil then amount = result[1].amount end
                total = total + curs * amount
            end
            stocks[#stocks+1] = {name = v.company, curs = curs, amount = amount, freeamount = free_amount, totalamount = all_amount, totalamount =  1000, forsale = 0, forbuy = 0}
            --freeamount: 708, totalamount: 1000, forsale:0, forbuy:0
        end
    end

    
    TriggerClientEvent('investment:client:getdata', src, type, table6, today_6, table5, today_5, table4, today_4, table3, today_3, table2, today_2, table1, today_1, table, today, stocks, total)
end

RegisterServerEvent('investment:server:getdata')
AddEventHandler('investment:server:getdata', function(type)
    local src = source
    investment_server_getdata(src, type)
   
end)

RegisterServerEvent('investment:server:sale')
AddEventHandler('investment:server:sale', function(data)
    local src = source
    local company = data.name
    local amount = data.forsale
    if amount > 0 then
        local price = tonumber(data.curs)*tonumber(amount)
        local Player = QBCore.Functions.GetPlayer(src)
        local citizenid = Player.PlayerData.citizenid
        --print('investment:server:sale', company, amount, price)
        exports.oxmysql:execute('update investment set free_amount = free_amount + ? where company = ?', {amount, company})
        exports.oxmysql:execute('update players_stocks set amount = amount - ? where company = ? and citizenid = ?', {amount, company, citizenid})
        Player.Functions.AddMoney('bank', price, "investment")
        TriggerClientEvent('QBCore:Notify', src, 'Вы продали ' ..amount.. ' акции(й) ' ..company, "success", 3500)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Количество должно быть больше 0', "error", 3500)
    end
   
end)

RegisterServerEvent('investment:server:buy')
AddEventHandler('investment:server:buy', function(data)
    local src = source
    local company = data.name
    local amount = tonumber(data.forbuy)
    if amount > 0 then
        local price = tonumber(data.curs)*tonumber(amount)
        local Player = QBCore.Functions.GetPlayer(src)
        local canBuy = false
        if Player.PlayerData.money.bank >= price then
            Player.Functions.RemoveMoney('bank', price)
            canBuy = true
        end
        if Player.PlayerData.money.bank >= price then
            Player.Functions.RemoveMoney('cash', price)
            canBuy = true
        end
        if canBuy then 
            local citizenid = Player.PlayerData.citizenid
            print('investment:server:buy', company, amount, price, citizenid)
            exports.oxmysql:execute('update investment set free_amount = free_amount - ? where company = ?', {amount, company})
            local isstocks = exports.oxmysql:fetchSync('select * from players_stocks  where company = ? and citizenid = ?', {company, citizenid})
            if isstocks[1] ~= nil then
                exports.oxmysql:execute('update players_stocks set amount = amount + ? where company = ? and citizenid = ?', {amount, company, citizenid})
            else
                exports.oxmysql:execute('insert into players_stocks (amount, company, citizenid) values (?,?,?)', {amount, company, citizenid})
            end
            
            TriggerClientEvent('QBCore:Notify', src, 'Вы купили ' ..amount.. ' акции(й) ' ..company, "success", 3500)
        else
            TriggerClientEvent('QBCore:Notify', src, 'У вас нехватает средств на покупку', "error", 3500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Количество должно быть больше 0', "error", 3500)
    end
   
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000*60 )
        print('start  irs_server_setdata')
        investment_server_setdata()
        
    end
    
end)

