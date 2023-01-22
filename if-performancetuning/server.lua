if Config.ESX then

ESX = exports['es_extended']:getSharedObject()
      
ESX.RegisterServerCallback('TunningCash:canAfford', function(source, cb, price)
          
    local s = source
    local x = ESX.GetPlayerFromId(s)
    local steamname = GetPlayerName(source)
     
     if x.getMoney() >= tonumber(price) then
        x.removeMoney(tonumber(price))
            cb(true)
          else
             cb(false)
          end
end)

ESX.RegisterServerCallback('TunningBank:canAfford', function(source, cb, price)
          
   local s = source
   local x = ESX.GetPlayerFromId(s)
   local steamname = GetPlayerName(source)
    
    if x.getAccount('bank') >= tonumber(price) then
       xPlayer.removeAccountMoney('bank', (tonumber(price)))
           cb(true)
         else
            cb(false)
         end
end)

end

if Config.QBCORE then


   local QBCore = exports['qb-core']:GetCoreObject()

   QBCore.Functions.CreateCallback('TunningCash:canAfford', function(source, cb, price)
          
      local s = source
      local x = QBCore.Functions.GetPlayer(s)
      local steamname = GetPlayerName(source)
       
      if x.PlayerData.money["cash"] >= tonumber(price) then
         x.Functions.RemoveMoney('cash', tonumber(price))
             cb(true)
           else
              cb(false)
           end
  end)

   QBCore.Functions.CreateCallback('TunningBank:canAfford', function(source, cb, price)

      local s = source
      local x = IFCore.Functions.GetPlayer(s)
      local steamname = GetPlayerName(source)

       if x.PlayerData.money["bank"] >= tonumber(price) then
          x.Functions.RemoveMoney('bank', tonumber(price))
              cb(true)
            else
               cb(false)
            end
  end)


end