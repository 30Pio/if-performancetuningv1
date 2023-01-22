if Config.ESX then

ESX = exports['es_extended']:getSharedObject()

local display = false
customVehicle = nil
customVehicleData = nil

local buy = false

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end



function showHelpNotification(message)
    AddTextEntry('HelpNotification', message)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

function SetVehicleData(vehicle, props)
	if (props == nil) then return end

	SetVehicleModKit(vehicle, 0)
	SetVehicleAutoRepairDisabled(vehicle, false)

	if (props == nil or vehicle == nil or not DoesEntityExist(vehicle)) then return end
	
	SetVehicleModKit(vehicle, 0)
	SetVehicleAutoRepairDisabled(vehicle, false)

	if (props.plate) then
		SetVehicleNumberPlateText(vehicle, props.plate)
	end

	if (props.plateIndex) then
		SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
	end

	if (props.bodyHealth) then
		SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
	end

	if (props.engineHealth) then
		SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
	end

	if (props.fuelLevel) then
		SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
	end

	if (props.dirtLevel) then
		SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
	end

	if (props.color1) then
		ClearVehicleCustomPrimaryColour(vehicle)

		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, props.color1, color2)
	end

	if (props.color1Custom) then
		SetVehicleCustomPrimaryColour(vehicle, props.color1Custom[1], props.color1Custom[2], props.color1Custom[3])
	end

	if (props.color2) then
		ClearVehicleCustomSecondaryColour(vehicle)

		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, color1, props.color2)
	end

	if (props.color2Custom) then
		SetVehicleCustomSecondaryColour(vehicle, props.color2Custom[1], props.color2Custom[2], props.color2Custom[3])
	end

	if (props.color1Type) then
		SetVehicleModColor_1(vehicle, props.color1Type)
	end

	if (props.color2Type) then
		SetVehicleModColor_2(vehicle, props.color2Type)
	end

	if (props.pearlescentColor) then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
	end

	if (props.wheelColor) then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
	end

	if (props.wheels) then
		SetVehicleWheelType(vehicle, props.wheels)
	end

	if (props.windowTint) then
		SetVehicleWindowTint(vehicle, props.windowTint)
	end

	if (props.extras) then
		for id = 0, 25 do
			if (DoesExtraExist(vehicle, id)) then
				SetVehicleExtra(vehicle, id, props.extras[tostring(id)] and 0 or 1)
			end
		end
	end

	if (props.neonEnabled) then
		SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1] == true or props.neonEnabled[1] == 1)
		SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2] == true or props.neonEnabled[2] == 1)
		SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3] == true or props.neonEnabled[3] == 1)
		SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4] == true or props.neonEnabled[4] == 1)
	end

	if (props.neonColor) then
		SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
	end

	if (props.modSmokeEnabled) then
		ToggleVehicleMod(vehicle, 20, true)
	end

	if (props.tyreSmokeColor) then
		SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
	end

	if (props.modSpoilers) then
		SetVehicleMod(vehicle, 0, props.modSpoilers, false)
	end

	if (props.modFrontBumper) then
		SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
	end

	if (props.modRearBumper) then
		SetVehicleMod(vehicle, 2, props.modRearBumper, false)
	end

	if (props.modSideSkirt) then
		SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
	end

	if (props.modExhaust) then
		SetVehicleMod(vehicle, 4, props.modExhaust, false)
	end

	if (props.modFrame) then
		SetVehicleMod(vehicle, 5, props.modFrame, false)
	end

	if (props.modGrille) then
		SetVehicleMod(vehicle, 6, props.modGrille, false)
	end

	if (props.modHood) then
		SetVehicleMod(vehicle, 7, props.modHood, false)
	end

	if (props.modFender) then
		SetVehicleMod(vehicle, 8, props.modFender, false)
	end

	if (props.modRightFender) then
		SetVehicleMod(vehicle, 9, props.modRightFender, false)
	end

	if (props.modRoof) then
		SetVehicleMod(vehicle, 10, props.modRoof, false)
	end

	if (props.modEngine) then
		SetVehicleMod(vehicle, 11, props.modEngine, false)
	end

	if (props.modBrakes) then
		SetVehicleMod(vehicle, 12, props.modBrakes, false)
	end

	if (props.modTransmission) then
		SetVehicleMod(vehicle, 13, props.modTransmission, false)
	end

	if (props.modHorns) then
		SetVehicleMod(vehicle, 14, props.modHorns, false)
	end

	if (props.modSuspension) then
		SetVehicleMod(vehicle, 15, props.modSuspension, false)
	end

	if (props.modArmor) then
		SetVehicleMod(vehicle, 16, props.modArmor, false)
	end

	if (props.modTurbo) then
		ToggleVehicleMod(vehicle,  18, props.modTurbo)
	end

	if (props.modXenon) then
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleXenonLightsColour(vehicle, props.modXenon)
	end

	if (props.modFrontWheels) then
		SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
	end

	if (props.modBackWheels) then
		SetVehicleMod(vehicle, 24, props.modBackWheels, false)
	end

	if (props.modPlateHolder) then
		SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
	end

	if (props.modVanityPlate) then
		SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
	end

	if (props.modTrimA) then
		SetVehicleMod(vehicle, 27, props.modTrimA, false)
	end

	if (props.modOrnaments) then
		SetVehicleMod(vehicle, 28, props.modOrnaments, false)
	end

	if (props.modDashboard) then
		SetVehicleMod(vehicle, 29, props.modDashboard, false)
	end

	if (props.modDial) then
		SetVehicleMod(vehicle, 30, props.modDial, false)
	end

	if (props.modDoorSpeaker) then
		SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
	end

	if (props.modSeats) then
		SetVehicleMod(vehicle, 32, props.modSeats, false)
	end

	if (props.modSteeringWheel) then
		SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
	end

	if (props.modShifterLeavers) then
		SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
	end

	if (props.modAPlate) then
		SetVehicleMod(vehicle, 35, props.modAPlate, false)
	end

	if (props.modSpeakers) then
		SetVehicleMod(vehicle, 36, props.modSpeakers, false)
	end

	if (props.modTrunk) then
		SetVehicleMod(vehicle, 37, props.modTrunk, false)
	end

	if (props.modHydrolic) then
		SetVehicleMod(vehicle, 38, props.modHydrolic, false)
	end

	if (props.modEngineBlock) then
		SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
	end

	if (props.modAirFilter) then
		SetVehicleMod(vehicle, 40, props.modAirFilter, false)
	end

	if (props.modStruts) then
		SetVehicleMod(vehicle, 41, props.modStruts, false)
	end

	if (props.modArchCover) then
		SetVehicleMod(vehicle, 42, props.modArchCover, false)
	end

	if (props.modAerials) then
		SetVehicleMod(vehicle, 43, props.modAerials, false)
	end

	if (props.modTrimB) then
		SetVehicleMod(vehicle, 44, props.modTrimB, false)
	end

	if (props.modTank) then
		SetVehicleMod(vehicle, 45, props.modTank, false)
	end

	if (props.modWindows) then
		SetVehicleMod(vehicle, 46, props.modWindows, false)
	end

	if (props.modLivery) then
		SetVehicleMod(vehicle, 48, props.modLivery, false)
	end

	if (props.livery) then
		SetVehicleLivery(vehicle, props.livery)
	end	
end

function SetVehicleModData(vehicle, modType, data)
	SetVehicleModKit(vehicle, 0)
	SetVehicleAutoRepairDisabled(vehicle, false)

	if (modType == 'plateIndex') then
		SetVehicleNumberPlateTextIndex(vehicle, data)
	elseif (modType == 'color1') then
		SetVehicleCustomPrimaryColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
	elseif (modType == 'color2') then
		SetVehicleCustomSecondaryColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
	elseif (modType == 'paintType1') then
		SetVehicleModColor_1(vehicle, data)
	elseif (modType == 'paintType2') then
		SetVehicleModColor_2(vehicle, data)
	elseif (modType == 'pearlescentColor') then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, tonumber(data), wheelColor)
	elseif (modType == 'wheelColor') then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, pearlescentColor, tonumber(data))
	elseif (modType == 'wheels') then
		SetVehicleMod(vehicle, 23, -1, false)
		SetVehicleWheelType(vehicle, tonumber(data))
	elseif (modType == 'windowTint') then
		SetVehicleWindowTint(vehicle, tonumber(data))
	elseif (modType == 'extras') then
		local tempList = {}
		for id = 0, 25, 1 do
			if (DoesExtraExist(vehicle, id)) then
				table.insert(tempList, id)
			end
		end
		
		if (DoesExtraExist(vehicle, tempList[data.id])) then
			SetVehicleExtra(vehicle, tempList[data.id], data.enable)
		end
	elseif (modType == 'neonColor') then
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		
		SetVehicleNeonLightsColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
	elseif (modType == 'tyreSmokeColor') then
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
	elseif (modType == 'modXenon') then
		ToggleVehicleMod(vehicle, 22, true)

		if (true) then
			SetVehicleXenonLightsColour(vehicle, tonumber(data))
		end
	elseif (modType == 'livery') then
		SetVehicleLivery(vehicle, data)
	elseif (type(modType) == 'number' and (modType == 23 or modType == 24)) then
		SetVehicleMod(vehicle, 23, data, false)

		if (IsThisModelABike(GetEntityModel(vehicle))) then
			SetVehicleMod(vehicle, 24, data, false)
		end
	elseif (type(modType) == 'number' and modType >= 17 and modType <= 22) then -- TOGGLE
		ToggleVehicleMod(vehicle, modType, data + 1)
	elseif (type(modType) == 'number') then -- MOD
		SetVehicleMod(vehicle, modType, data, false)
	end
end

function GetVehicleData(vehicle)
	local color1, color2 = GetVehicleColours(vehicle)
	
	local color1Custom = {}
	color1Custom[1], color1Custom[2], color1Custom[3] = GetVehicleCustomPrimaryColour(vehicle)
	
	local color2Custom = {}
	color2Custom[1], color2Custom[2], color2Custom[3] = GetVehicleCustomSecondaryColour(vehicle)
	
	local color1Type = GetVehicleModColor_1(vehicle)
	local color2Type = GetVehicleModColor_2(vehicle)

	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	
	local extras = {}
	for id = 0, 25 do
		if (DoesExtraExist(vehicle, id)) then
			extras[tostring(id)] = IsVehicleExtraTurnedOn(vehicle, id)
		end
	end

	local neonColor = {}
	neonColor[1], neonColor[2], neonColor[3] = GetVehicleNeonLightsColour(vehicle)

	local tyreSmokeColor = {}
	tyreSmokeColor[1], tyreSmokeColor[2], tyreSmokeColor[3] = GetVehicleTyreSmokeColor(vehicle)
	
	local tempData = {
		model             = GetEntityModel(vehicle),

		color1            = color1,
		color1Custom      = color1Custom,
		
		color2            = color2,
		color2Custom      = color2Custom,

		pearlescentColor  = pearlescentColor,

		color1Type 		  = GetVehicleModColor_1(vehicle),
		color2Type 		  = GetVehicleModColor_2(vehicle),

		wheelColor        = wheelColor,
		wheels            = GetVehicleWheelType(vehicle),
		windowTint        = GetVehicleWindowTint(vehicle),

		extras            = extras,

		neonEnabled       = {
			IsVehicleNeonLightEnabled(vehicle, 0),
			IsVehicleNeonLightEnabled(vehicle, 1),
			IsVehicleNeonLightEnabled(vehicle, 2),
			IsVehicleNeonLightEnabled(vehicle, 3)
		},
		
		neonColor         = neonColor,
		tyreSmokeColor    = tyreSmokeColor,

		modSpoilers       = GetVehicleMod(vehicle, 0),
		modFrontBumper    = GetVehicleMod(vehicle, 1),
		modRearBumper     = GetVehicleMod(vehicle, 2),
		modSideSkirt      = GetVehicleMod(vehicle, 3),
		modExhaust        = GetVehicleMod(vehicle, 4),
		modFrame          = GetVehicleMod(vehicle, 5),
		modGrille         = GetVehicleMod(vehicle, 6),
		modHood           = GetVehicleMod(vehicle, 7),
		modFender         = GetVehicleMod(vehicle, 8),
		modRightFender    = GetVehicleMod(vehicle, 9),
		modRoof           = GetVehicleMod(vehicle, 10),

		modEngine         = GetVehicleMod(vehicle, 11),
		modBrakes         = GetVehicleMod(vehicle, 12),
		modTransmission   = GetVehicleMod(vehicle, 13),
		modHorns          = GetVehicleMod(vehicle, 14),
		modSuspension     = GetVehicleMod(vehicle, 15),
		modArmor          = GetVehicleMod(vehicle, 16),

		modTurbo          = IsToggleModOn(vehicle, 18),
		modSmokeEnabled   = IsToggleModOn(vehicle, 20),
		modXenon          = GetVehicleXenonLightsColour(vehicle),

		modFrontWheels    = GetVehicleMod(vehicle, 23),
		modBackWheels     = GetVehicleMod(vehicle, 24),

		modPlateHolder    = GetVehicleMod(vehicle, 25),
		modVanityPlate    = GetVehicleMod(vehicle, 26),
		modTrimA          = GetVehicleMod(vehicle, 27),
		modOrnaments      = GetVehicleMod(vehicle, 28),
		modDashboard      = GetVehicleMod(vehicle, 29),
		modDial           = GetVehicleMod(vehicle, 30),
		modDoorSpeaker    = GetVehicleMod(vehicle, 31),
		modSeats          = GetVehicleMod(vehicle, 32),
		modSteeringWheel  = GetVehicleMod(vehicle, 33),
		modShifterLeavers = GetVehicleMod(vehicle, 34),
		modAPlate         = GetVehicleMod(vehicle, 35),
		modSpeakers       = GetVehicleMod(vehicle, 36),
		modTrunk          = GetVehicleMod(vehicle, 37),
		modHydrolic       = GetVehicleMod(vehicle, 38),
		modEngineBlock    = GetVehicleMod(vehicle, 39),
		modAirFilter      = GetVehicleMod(vehicle, 40),
		modStruts         = GetVehicleMod(vehicle, 41),
		modArchCover      = GetVehicleMod(vehicle, 42),
		modAerials        = GetVehicleMod(vehicle, 43),
		modTrimB          = GetVehicleMod(vehicle, 44),
		modTank           = GetVehicleMod(vehicle, 45),
		modWindows        = GetVehicleMod(vehicle, 46),
		modLivery         = GetVehicleMod(vehicle, 48),
		livery            = GetVehicleLivery(vehicle)
	}

	tempData.modTurbo = tempData.modTurbo or 0
	
	return tempData
end

Citizen.CreateThread(function()
    local sleep = 500
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    while true do
        local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
            for k,v in pairs(Config.Location) do
            local dist = GetDistanceBetweenCoords(playerCoords, v.markerposition)
            if dist <= v.dist then
                if (playerVeh ~= 0 and DoesEntityExist(playerVeh)) then
                showHelpNotification(Config.Locales.interactmessage)
                if IsControlJustReleased(0, 54) then
                 

                customVehicle = playerVeh

                customVehicleData = GetVehicleData(customVehicle)
				locale()
                 SetDisplay(true)
              end
              sleep = 4
            end
        end
        end
        Wait(sleep)
    end
end)


function locale()
	SendNUIMessage({
		type = "locale",
		titlelocale = Config.Locales.titlelocale,
		descriptionlocale = Config.Locales.descriptionlocale,
	})
	
end

RegisterNUICallback('selected', function(data)
    local teilid = data.teilid

    SendNUIMessage({
        type = "clearlist"
    })

    if teilid == "1" then
    for key, value in pairs(Config.TunningTeile.Motor) do
        SendNUIMessage({
            type = "add",
            price = value.price,
            teil = value.teil,
            getid = key,
            teilid = data.teilid,
        })
    end

    elseif teilid == "2" then
        for key, value in pairs(Config.TunningTeile.Suspension) do
            SendNUIMessage({
                type = "add",
                price = value.price,
                teil = value.teil,
                getid = key,
                teilid = data.teilid,
            })
        end
    elseif teilid == "3" then
        for key, value in pairs(Config.TunningTeile.Brake) do
            SendNUIMessage({
                type = "add",
                price = value.price,
                teil = value.teil,
                getid = key,
                teilid = data.teilid,
            })
        end
    elseif teilid == "4" then
        for key, value in pairs(Config.TunningTeile.Turbo) do
            SendNUIMessage({
                type = "add",
                price = value.price,
                teil = value.teil,
                getid = key,
                teilid = data.teilid,
            })
        end
    elseif teilid == "5" then
        for key, value in pairs(Config.TunningTeile.Armour) do
            SendNUIMessage({
                type = "add",
                price = value.price,
                teil = value.teil,
                getid = key,
                teilid = data.teilid,
            })
        end
	elseif teilid == "6" then
        for key, value in pairs(Config.TunningTeile.Transmission) do
            SendNUIMessage({
                type = "add",
                price = value.price,
                teil = value.teil,
                getid = key,
                teilid = data.teilid,
            })
        end
    end
    
end)



RegisterNUICallback("select", function(data)

     
     local teilid = data.teilid
     local getid = data.getid
     local veh = GetVehiclePedIsIn(PlayerPedId(), false)
 
     if teilid == "1" then
        SetVehicleModKit(veh,0)
        SetVehicleMod(veh, 11, tonumber(getid), false)
    elseif teilid == "2" then
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 15, tonumber(getid), false)
        elseif teilid == "3" then
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 12, tonumber(getid), false)
        elseif teilid == "4" then
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 18, getid, false)
		elseif teilid == "5" then
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 16, tonumber(getid), false)
		elseif teilid == "6" then
            SetVehicleModKit(veh,0)
            SetVehicleMod(veh, 13, tonumber(getid), false)
        end
		
		
end)

RegisterNUICallback("buy", function(data, cb)
    ESX.TriggerServerCallback('TunningBank:canAfford', function(bool)

        if bool then
            Notification(Config.Locales.buymessage)
            SetDisplay(false)
        else
            Notification(Config.Locales.nomessage)
        end
    end, data.price)
    
end)

RegisterNUICallback("buycash", function(data, cb)
    ESX.TriggerServerCallback('TunningCash:canAfford', function(bool)

        if bool then
            Notification(Config.Locales.buymessage)
            SetDisplay(false)
        else
            Notification(Config.Locales.nomessage)
        end
    end, data.price)
    
end)

function close(resetVehToDefault)
    resetVehToDefault = resetVehToDefault or 0

    if (resetVehToDefault == 1) then
        SetVehicleData(customVehicle, customVehicleData)
    end

    customVehicle = nil
    customVehicleData = nil

    SetDisplay(false)

end


RegisterNUICallback("exit", function(data)
   
    local getid = data.getid
    local teilid = data.teilid
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)

    close(1)


end)

AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end

	if (resource == GetCurrentResourceName()) then
        if display then
            SetVehicleData(customVehicle, customVehicleData)
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Location) do
    
        local blip = AddBlipForCoord(v.markerposition)

        SetBlipSprite(blip, v.blipsprite)
        SetBlipScale(blip, v.blipscale)
        SetBlipColour(blip, v.blipcolor)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blipname)
        EndTextCommandSetBlipName(blip)
    end
end)

end

if Config.QBCORE then

	local QBCore = exports['qb-core']:GetCoreObject()
	
	local display = false
	customVehicle = nil
	customVehicleData = nil
	
	local buy = false
	
	function SetDisplay(bool)
		display = bool
		SetNuiFocus(bool, bool)
		SendNUIMessage({
			type = "ui",
			status = bool,
		})
	end
	
	
	
	function showHelpNotification(message)
		AddTextEntry('HelpNotification', message)
		DisplayHelpTextThisFrame('HelpNotification', false)
	end
	
	function SetVehicleData(vehicle, props)
		if (props == nil) then return end
	
		SetVehicleModKit(vehicle, 0)
		SetVehicleAutoRepairDisabled(vehicle, false)
	
		if (props == nil or vehicle == nil or not DoesEntityExist(vehicle)) then return end
		
		SetVehicleModKit(vehicle, 0)
		SetVehicleAutoRepairDisabled(vehicle, false)
	
		if (props.plate) then
			SetVehicleNumberPlateText(vehicle, props.plate)
		end
	
		if (props.plateIndex) then
			SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
		end
	
		if (props.bodyHealth) then
			SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
		end
	
		if (props.engineHealth) then
			SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
		end
	
		if (props.fuelLevel) then
			SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
		end
	
		if (props.dirtLevel) then
			SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
		end
	
		if (props.color1) then
			ClearVehicleCustomPrimaryColour(vehicle)
	
			local color1, color2 = GetVehicleColours(vehicle)
			SetVehicleColours(vehicle, props.color1, color2)
		end
	
		if (props.color1Custom) then
			SetVehicleCustomPrimaryColour(vehicle, props.color1Custom[1], props.color1Custom[2], props.color1Custom[3])
		end
	
		if (props.color2) then
			ClearVehicleCustomSecondaryColour(vehicle)
	
			local color1, color2 = GetVehicleColours(vehicle)
			SetVehicleColours(vehicle, color1, props.color2)
		end
	
		if (props.color2Custom) then
			SetVehicleCustomSecondaryColour(vehicle, props.color2Custom[1], props.color2Custom[2], props.color2Custom[3])
		end
	
		if (props.color1Type) then
			SetVehicleModColor_1(vehicle, props.color1Type)
		end
	
		if (props.color2Type) then
			SetVehicleModColor_2(vehicle, props.color2Type)
		end
	
		if (props.pearlescentColor) then
			local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
		end
	
		if (props.wheelColor) then
			local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
		end
	
		if (props.wheels) then
			SetVehicleWheelType(vehicle, props.wheels)
		end
	
		if (props.windowTint) then
			SetVehicleWindowTint(vehicle, props.windowTint)
		end
	
		if (props.extras) then
			for id = 0, 25 do
				if (DoesExtraExist(vehicle, id)) then
					SetVehicleExtra(vehicle, id, props.extras[tostring(id)] and 0 or 1)
				end
			end
		end
	
		if (props.neonEnabled) then
			SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1] == true or props.neonEnabled[1] == 1)
			SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2] == true or props.neonEnabled[2] == 1)
			SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3] == true or props.neonEnabled[3] == 1)
			SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4] == true or props.neonEnabled[4] == 1)
		end
	
		if (props.neonColor) then
			SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
		end
	
		if (props.modSmokeEnabled) then
			ToggleVehicleMod(vehicle, 20, true)
		end
	
		if (props.tyreSmokeColor) then
			SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
		end
	
		if (props.modSpoilers) then
			SetVehicleMod(vehicle, 0, props.modSpoilers, false)
		end
	
		if (props.modFrontBumper) then
			SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
		end
	
		if (props.modRearBumper) then
			SetVehicleMod(vehicle, 2, props.modRearBumper, false)
		end
	
		if (props.modSideSkirt) then
			SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
		end
	
		if (props.modExhaust) then
			SetVehicleMod(vehicle, 4, props.modExhaust, false)
		end
	
		if (props.modFrame) then
			SetVehicleMod(vehicle, 5, props.modFrame, false)
		end
	
		if (props.modGrille) then
			SetVehicleMod(vehicle, 6, props.modGrille, false)
		end
	
		if (props.modHood) then
			SetVehicleMod(vehicle, 7, props.modHood, false)
		end
	
		if (props.modFender) then
			SetVehicleMod(vehicle, 8, props.modFender, false)
		end
	
		if (props.modRightFender) then
			SetVehicleMod(vehicle, 9, props.modRightFender, false)
		end
	
		if (props.modRoof) then
			SetVehicleMod(vehicle, 10, props.modRoof, false)
		end
	
		if (props.modEngine) then
			SetVehicleMod(vehicle, 11, props.modEngine, false)
		end
	
		if (props.modBrakes) then
			SetVehicleMod(vehicle, 12, props.modBrakes, false)
		end
	
		if (props.modTransmission) then
			SetVehicleMod(vehicle, 13, props.modTransmission, false)
		end
	
		if (props.modHorns) then
			SetVehicleMod(vehicle, 14, props.modHorns, false)
		end
	
		if (props.modSuspension) then
			SetVehicleMod(vehicle, 15, props.modSuspension, false)
		end
	
		if (props.modArmor) then
			SetVehicleMod(vehicle, 16, props.modArmor, false)
		end
	
		if (props.modTurbo) then
			ToggleVehicleMod(vehicle,  18, props.modTurbo)
		end
	
		if (props.modXenon) then
			ToggleVehicleMod(vehicle, 22, true)
			SetVehicleXenonLightsColour(vehicle, props.modXenon)
		end
	
		if (props.modFrontWheels) then
			SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
		end
	
		if (props.modBackWheels) then
			SetVehicleMod(vehicle, 24, props.modBackWheels, false)
		end
	
		if (props.modPlateHolder) then
			SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
		end
	
		if (props.modVanityPlate) then
			SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
		end
	
		if (props.modTrimA) then
			SetVehicleMod(vehicle, 27, props.modTrimA, false)
		end
	
		if (props.modOrnaments) then
			SetVehicleMod(vehicle, 28, props.modOrnaments, false)
		end
	
		if (props.modDashboard) then
			SetVehicleMod(vehicle, 29, props.modDashboard, false)
		end
	
		if (props.modDial) then
			SetVehicleMod(vehicle, 30, props.modDial, false)
		end
	
		if (props.modDoorSpeaker) then
			SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
		end
	
		if (props.modSeats) then
			SetVehicleMod(vehicle, 32, props.modSeats, false)
		end
	
		if (props.modSteeringWheel) then
			SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
		end
	
		if (props.modShifterLeavers) then
			SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
		end
	
		if (props.modAPlate) then
			SetVehicleMod(vehicle, 35, props.modAPlate, false)
		end
	
		if (props.modSpeakers) then
			SetVehicleMod(vehicle, 36, props.modSpeakers, false)
		end
	
		if (props.modTrunk) then
			SetVehicleMod(vehicle, 37, props.modTrunk, false)
		end
	
		if (props.modHydrolic) then
			SetVehicleMod(vehicle, 38, props.modHydrolic, false)
		end
	
		if (props.modEngineBlock) then
			SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
		end
	
		if (props.modAirFilter) then
			SetVehicleMod(vehicle, 40, props.modAirFilter, false)
		end
	
		if (props.modStruts) then
			SetVehicleMod(vehicle, 41, props.modStruts, false)
		end
	
		if (props.modArchCover) then
			SetVehicleMod(vehicle, 42, props.modArchCover, false)
		end
	
		if (props.modAerials) then
			SetVehicleMod(vehicle, 43, props.modAerials, false)
		end
	
		if (props.modTrimB) then
			SetVehicleMod(vehicle, 44, props.modTrimB, false)
		end
	
		if (props.modTank) then
			SetVehicleMod(vehicle, 45, props.modTank, false)
		end
	
		if (props.modWindows) then
			SetVehicleMod(vehicle, 46, props.modWindows, false)
		end
	
		if (props.modLivery) then
			SetVehicleMod(vehicle, 48, props.modLivery, false)
		end
	
		if (props.livery) then
			SetVehicleLivery(vehicle, props.livery)
		end	
	end
	
	function SetVehicleModData(vehicle, modType, data)
		SetVehicleModKit(vehicle, 0)
		SetVehicleAutoRepairDisabled(vehicle, false)
	
		if (modType == 'plateIndex') then
			SetVehicleNumberPlateTextIndex(vehicle, data)
		elseif (modType == 'color1') then
			SetVehicleCustomPrimaryColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
		elseif (modType == 'color2') then
			SetVehicleCustomSecondaryColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
		elseif (modType == 'paintType1') then
			SetVehicleModColor_1(vehicle, data)
		elseif (modType == 'paintType2') then
			SetVehicleModColor_2(vehicle, data)
		elseif (modType == 'pearlescentColor') then
			local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle, tonumber(data), wheelColor)
		elseif (modType == 'wheelColor') then
			local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
			SetVehicleExtraColours(vehicle, pearlescentColor, tonumber(data))
		elseif (modType == 'wheels') then
			SetVehicleMod(vehicle, 23, -1, false)
			SetVehicleWheelType(vehicle, tonumber(data))
		elseif (modType == 'windowTint') then
			SetVehicleWindowTint(vehicle, tonumber(data))
		elseif (modType == 'extras') then
			local tempList = {}
			for id = 0, 25, 1 do
				if (DoesExtraExist(vehicle, id)) then
					table.insert(tempList, id)
				end
			end
			
			if (DoesExtraExist(vehicle, tempList[data.id])) then
				SetVehicleExtra(vehicle, tempList[data.id], data.enable)
			end
		elseif (modType == 'neonColor') then
			SetVehicleNeonLightEnabled(vehicle, 0, true)
			SetVehicleNeonLightEnabled(vehicle, 1, true)
			SetVehicleNeonLightEnabled(vehicle, 2, true)
			SetVehicleNeonLightEnabled(vehicle, 3, true)
			
			SetVehicleNeonLightsColour(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
		elseif (modType == 'tyreSmokeColor') then
			ToggleVehicleMod(vehicle, 20, true)
			SetVehicleTyreSmokeColor(vehicle, tonumber(data[1]), tonumber(data[2]), tonumber(data[3]))
		elseif (modType == 'modXenon') then
			ToggleVehicleMod(vehicle, 22, true)
	
			if (true) then
				SetVehicleXenonLightsColour(vehicle, tonumber(data))
			end
		elseif (modType == 'livery') then
			SetVehicleLivery(vehicle, data)
		elseif (type(modType) == 'number' and (modType == 23 or modType == 24)) then
			SetVehicleMod(vehicle, 23, data, false)
	
			if (IsThisModelABike(GetEntityModel(vehicle))) then
				SetVehicleMod(vehicle, 24, data, false)
			end
		elseif (type(modType) == 'number' and modType >= 17 and modType <= 22) then -- TOGGLE
			ToggleVehicleMod(vehicle, modType, data + 1)
		elseif (type(modType) == 'number') then -- MOD
			SetVehicleMod(vehicle, modType, data, false)
		end
	end
	
	function GetVehicleData(vehicle)
		local color1, color2 = GetVehicleColours(vehicle)
		
		local color1Custom = {}
		color1Custom[1], color1Custom[2], color1Custom[3] = GetVehicleCustomPrimaryColour(vehicle)
		
		local color2Custom = {}
		color2Custom[1], color2Custom[2], color2Custom[3] = GetVehicleCustomSecondaryColour(vehicle)
		
		local color1Type = GetVehicleModColor_1(vehicle)
		local color2Type = GetVehicleModColor_2(vehicle)
	
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		
		local extras = {}
		for id = 0, 25 do
			if (DoesExtraExist(vehicle, id)) then
				extras[tostring(id)] = IsVehicleExtraTurnedOn(vehicle, id)
			end
		end
	
		local neonColor = {}
		neonColor[1], neonColor[2], neonColor[3] = GetVehicleNeonLightsColour(vehicle)
	
		local tyreSmokeColor = {}
		tyreSmokeColor[1], tyreSmokeColor[2], tyreSmokeColor[3] = GetVehicleTyreSmokeColor(vehicle)
		
		local tempData = {
			model             = GetEntityModel(vehicle),
	
			color1            = color1,
			color1Custom      = color1Custom,
			
			color2            = color2,
			color2Custom      = color2Custom,
	
			pearlescentColor  = pearlescentColor,
	
			color1Type 		  = GetVehicleModColor_1(vehicle),
			color2Type 		  = GetVehicleModColor_2(vehicle),
	
			wheelColor        = wheelColor,
			wheels            = GetVehicleWheelType(vehicle),
			windowTint        = GetVehicleWindowTint(vehicle),
	
			extras            = extras,
	
			neonEnabled       = {
				IsVehicleNeonLightEnabled(vehicle, 0),
				IsVehicleNeonLightEnabled(vehicle, 1),
				IsVehicleNeonLightEnabled(vehicle, 2),
				IsVehicleNeonLightEnabled(vehicle, 3)
			},
			
			neonColor         = neonColor,
			tyreSmokeColor    = tyreSmokeColor,
	
			modSpoilers       = GetVehicleMod(vehicle, 0),
			modFrontBumper    = GetVehicleMod(vehicle, 1),
			modRearBumper     = GetVehicleMod(vehicle, 2),
			modSideSkirt      = GetVehicleMod(vehicle, 3),
			modExhaust        = GetVehicleMod(vehicle, 4),
			modFrame          = GetVehicleMod(vehicle, 5),
			modGrille         = GetVehicleMod(vehicle, 6),
			modHood           = GetVehicleMod(vehicle, 7),
			modFender         = GetVehicleMod(vehicle, 8),
			modRightFender    = GetVehicleMod(vehicle, 9),
			modRoof           = GetVehicleMod(vehicle, 10),
	
			modEngine         = GetVehicleMod(vehicle, 11),
			modBrakes         = GetVehicleMod(vehicle, 12),
			modTransmission   = GetVehicleMod(vehicle, 13),
			modHorns          = GetVehicleMod(vehicle, 14),
			modSuspension     = GetVehicleMod(vehicle, 15),
			modArmor          = GetVehicleMod(vehicle, 16),
	
			modTurbo          = IsToggleModOn(vehicle, 18),
			modSmokeEnabled   = IsToggleModOn(vehicle, 20),
			modXenon          = GetVehicleXenonLightsColour(vehicle),
	
			modFrontWheels    = GetVehicleMod(vehicle, 23),
			modBackWheels     = GetVehicleMod(vehicle, 24),
	
			modPlateHolder    = GetVehicleMod(vehicle, 25),
			modVanityPlate    = GetVehicleMod(vehicle, 26),
			modTrimA          = GetVehicleMod(vehicle, 27),
			modOrnaments      = GetVehicleMod(vehicle, 28),
			modDashboard      = GetVehicleMod(vehicle, 29),
			modDial           = GetVehicleMod(vehicle, 30),
			modDoorSpeaker    = GetVehicleMod(vehicle, 31),
			modSeats          = GetVehicleMod(vehicle, 32),
			modSteeringWheel  = GetVehicleMod(vehicle, 33),
			modShifterLeavers = GetVehicleMod(vehicle, 34),
			modAPlate         = GetVehicleMod(vehicle, 35),
			modSpeakers       = GetVehicleMod(vehicle, 36),
			modTrunk          = GetVehicleMod(vehicle, 37),
			modHydrolic       = GetVehicleMod(vehicle, 38),
			modEngineBlock    = GetVehicleMod(vehicle, 39),
			modAirFilter      = GetVehicleMod(vehicle, 40),
			modStruts         = GetVehicleMod(vehicle, 41),
			modArchCover      = GetVehicleMod(vehicle, 42),
			modAerials        = GetVehicleMod(vehicle, 43),
			modTrimB          = GetVehicleMod(vehicle, 44),
			modTank           = GetVehicleMod(vehicle, 45),
			modWindows        = GetVehicleMod(vehicle, 46),
			modLivery         = GetVehicleMod(vehicle, 48),
			livery            = GetVehicleLivery(vehicle)
		}
	
		tempData.modTurbo = tempData.modTurbo or 0
		
		return tempData
	end
	
	Citizen.CreateThread(function()
		local sleep = 500
		local textDrawn = false
		local playerPed = PlayerPedId()
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		while true do
			local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
				for k,v in pairs(Config.Location) do
				local dist = GetDistanceBetweenCoords(playerCoords, v.markerposition)
				if dist <= v.dist then
					
					if not textDrawn then
						exports['qb-core']:DrawText(Config.Locales.interactmessage, 'left')
						textDrawn = true
					end
					
					if IsControlJustReleased(0, 54) then
					
					customVehicle = playerVeh
	
					customVehicleData = GetVehicleData(customVehicle)
					locale()
					 SetDisplay(true)
				  end
				  sleep = 4

				end
			end
			Wait(sleep)
		end
	end)
	
	
	function locale()
		SendNUIMessage({
			type = "locale",
			titlelocale = Config.Locales.titlelocale,
			descriptionlocale = Config.Locales.descriptionlocale,
		})
		
	end
	
	RegisterNUICallback('selected', function(data)
		local teilid = data.teilid
	
		SendNUIMessage({
			type = "clearlist"
		})
	
		if teilid == "1" then
		for key, value in pairs(Config.TunningTeile.Motor) do
			SendNUIMessage({
				type = "add",
				price = value.price,
				teil = value.teil,
				getid = key,
				teilid = data.teilid,
			})
		end
	
		elseif teilid == "2" then
			for key, value in pairs(Config.TunningTeile.Suspension) do
				SendNUIMessage({
					type = "add",
					price = value.price,
					teil = value.teil,
					getid = key,
					teilid = data.teilid,
				})
			end
		elseif teilid == "3" then
			for key, value in pairs(Config.TunningTeile.Brake) do
				SendNUIMessage({
					type = "add",
					price = value.price,
					teil = value.teil,
					getid = key,
					teilid = data.teilid,
				})
			end
		elseif teilid == "4" then
			for key, value in pairs(Config.TunningTeile.Turbo) do
				SendNUIMessage({
					type = "add",
					price = value.price,
					teil = value.teil,
					getid = key,
					teilid = data.teilid,
				})
			end
		elseif teilid == "5" then
			for key, value in pairs(Config.TunningTeile.Armour) do
				SendNUIMessage({
					type = "add",
					price = value.price,
					teil = value.teil,
					getid = key,
					teilid = data.teilid,
				})
			end
		elseif teilid == "6" then
			for key, value in pairs(Config.TunningTeile.Transmission) do
				SendNUIMessage({
					type = "add",
					price = value.price,
					teil = value.teil,
					getid = key,
					teilid = data.teilid,
				})
			end
		end
		
	end)
	
	
	
	RegisterNUICallback("select", function(data)
	
		 
		 local teilid = data.teilid
		 local getid = data.getid
		 local veh = GetVehiclePedIsIn(PlayerPedId(), false)
	 
		 if teilid == "1" then
			SetVehicleModKit(veh,0)
			SetVehicleMod(veh, 11, tonumber(getid), false)
		elseif teilid == "2" then
				SetVehicleModKit(veh,0)
				SetVehicleMod(veh, 15, tonumber(getid), false)
			elseif teilid == "3" then
				SetVehicleModKit(veh,0)
				SetVehicleMod(veh, 12, tonumber(getid), false)
			elseif teilid == "4" then
				SetVehicleModKit(veh,0)
				SetVehicleMod(veh, 18, getid, false)
			elseif teilid == "5" then
				SetVehicleModKit(veh,0)
				SetVehicleMod(veh, 16, tonumber(getid), false)
			elseif teilid == "6" then
				SetVehicleModKit(veh,0)
				SetVehicleMod(veh, 13, tonumber(getid), false)
			end
			
			
	end)
	
	RegisterNUICallback("buy", function(data, cb)
			QBCore.Functions.TriggerCallback('TunningBank:canAfford', function(bool)
	
			if bool then
				Notification(Config.Locales.buymessage)
				SetDisplay(false)
			else
				Notification(Config.Locales.nomessage)
			end
		end, data.price)
		
	end)
	
	RegisterNUICallback("buycash", function(data, cb)
		QBCore.Functions.TriggerCallback('TunningCash:canAfford', function(bool)

		if bool then
			Notification(Config.Locales.buymessage)
			SetDisplay(false)
		else
			Notification(Config.Locales.nomessage)
		end
	end, data.price)
	
end)

	function close(resetVehToDefault)
		resetVehToDefault = resetVehToDefault or 0
	
		if (resetVehToDefault == 1) then
			SetVehicleData(customVehicle, customVehicleData)
		end
	
		customVehicle = nil
		customVehicleData = nil
	
		SetDisplay(false)
	
	end
	
	
	RegisterNUICallback("exit", function(data)
	   
		local getid = data.getid
		local teilid = data.teilid
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
	
		close(1)
	
	
	end)
	
	AddEventHandler('onResourceStop', function(resource)
		if (GetCurrentServerEndpoint() == nil) then
			return
		end
	
		if (resource == GetCurrentResourceName()) then
			if display then
				SetVehicleData(customVehicle, customVehicleData)
			end
		end
	end)
	
	Citizen.CreateThread(function()
		for k,v in pairs(Config.Location) do
		
			local blip = AddBlipForCoord(v.markerposition)
	
			SetBlipSprite(blip, v.blipsprite)
			SetBlipScale(blip, v.blipscale)
			SetBlipColour(blip, v.blipcolor)
			SetBlipDisplay(blip, 4)
			SetBlipAsShortRange(blip, true)
	
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.blipname)
			EndTextCommandSetBlipName(blip)
		end
	end)
	
	end