local QBCore = exports['qb-core']:GetCoreObject()
local ESX = exports["es_extended"]:getSharedObject()

-- Function to handle rolling up the weed
local function processItem(source, itemName)
	if GetResourceState('es_extended') == 'started' then
		local Player = ESX.GetPlayerFromId(source)
		if Player then
			local item = Player.getInventoryItem(itemName)
			if item and item.count > 0 then
				for category, items in pairs(Config.rollableitems) do
					for _, rollable in ipairs(items) do
						local rollableItem = Player.getInventoryItem(rollable)
						if rollableItem and rollableItem.count >= 1 then
							if category == 'blunts' then
								local text = ESX.GetItemLabel(Config.usableItems[itemName][rollable])
								TriggerClientEvent("dc_weed:rollupbackwood", source, text)
							elseif category == 'papers' then
								local text = ESX.GetItemLabel(Config.usableItems[itemName][rollable])
								TriggerClientEvent("dc_weed:rollupjoint", source, text)
							end
							if Config.usableItems[itemName] and Config.usableItems[itemName][rollable] then
								local rolledItem = Config.usableItems[itemName][rollable]
								if Player.canCarryItem(rolledItem, 1) then
									Player.removeInventoryItem(itemName, 1)
									Player.removeInventoryItem(rollable, 1)
									Citizen.Wait(24600)
									Player.addInventoryItem(rolledItem, 1)
									found = true
									break
								else
									local title = 'Cant Carry'
									local msg = 'You have no more space in your pockets'
									local ntype = 'error'
									TriggerClientEvent("dc_weed:notify", source, title, msg, ntype)
								end
							else
								print("Error: Item " .. tostring(itemName) .. " does not have a corresponding rolled item for " .. tostring(rollable))
							end
						end
					end
				end
			else
				local title = 'No Item'
				local msg = 'You dont have the required items'
				local ntype = 'error'
				TriggerClientEvent("dc_weed:notify", source, title, msg, ntype)
			end
		else
			print("Player is nil")
		end
	end
	if GetResourceState('qb-core') == 'started' then
		local Player = QBCore.Functions.GetPlayer(source)
		if Player then
			local item = Player.Functions.GetItemByName(itemName)
			if item and item.amount > 0 then
				for category, items in pairs(Config.rollableitems) do
					for _, rollable in ipairs(items) do
						local rollableItem = Player.Functions.GetItemByName(rollable)
						if rollableItem and rollableItem.amount >= 1 then
							if category == 'blunts' then
								local text = QBCore.Shared.Items[itemName].label .. " and " .. QBCore.Shared.Items[rollable].label
								TriggerClientEvent("dc_weed:rollupbackwood", source, text)
							elseif category == 'papers' then
								local text = QBCore.Shared.Items[itemName].label .. " and " .. QBCore.Shared.Items[rollable].label
								TriggerClientEvent("dc_weed:rollupjoint", source, text)
							end
							if Config.usableItems[itemName] and Config.usableItems[itemName][rollable] then
								local rolledItem = Config.usableItems[itemName][rollable]
								if Player.Functions.CanCarryItem(rolledItem, 1) then
									Player.Functions.RemoveItem(itemName, 1)
									Player.Functions.RemoveItem(rollable, 1)
									Citizen.Wait(24600)
									Player.Functions.AddItem(rolledItem, 1)
									found = true
									break
								else
									local title = 'Cant Carry'
									local msg = 'You have no more space in your pockets'
									local ntype = 'error'
									TriggerClientEvent("dc_weed:notify", source, title, msg, ntype)
								end
							else
								print("Error: Item " .. tostring(itemName) .. " does not have a corresponding rolled item for " .. tostring(rollable))
							end
						end
					end
				end
			else
				local title = 'No Item'
				local msg = 'You dont have the required items'
				local ntype = 'error'
				TriggerClientEvent("dc_weed:notify", source, title, msg, ntype)
			end
		else
			print("Player is nil")
		end
	end
end

-- Register the usable weed items
for itemName, _ in pairs(Config.usableItems) do
	if GetResourceState('es_extended') == 'started' then
		ESX.RegisterUsableItem(itemName, function(source)
			processItem(source, itemName)
		end)
	end
	if GetResourceState('qb-core') == 'started' then
		QBCore.Functions.CreateUseableItem(itemName, function(source)
			processItem(source, itemName)
		end)
	end
end
