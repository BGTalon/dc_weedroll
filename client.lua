local models = {
    backwood = "dc_backwood",
    weednug = "dc_weednug",
    backwoodlit = "dc_backwoodlit",
    rollpaper = "dc_rollpaper",
    joint = "p_cs_joint_02"
}

local animDict = "custom@rollingupanim"

local function requestModels()
    for _, model in pairs(models) do
        RequestModel(GetHashKey(model))
    end
    RequestAnimDict(animDict)
end

local function waitForModels()
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end
    for _, model in pairs(models) do
        while not HasModelLoaded(GetHashKey(model)) do
            Citizen.Wait(10)
        end
    end
end

local function attachEntity(entity, player, boneIndex, x, y, z, rx, ry, rz)
    AttachEntityToEntity(entity, player, GetPedBoneIndex(player, boneIndex), x, y, z, rx, ry, rz, 1, 1, 0, 0, 2, 1)
end

local function detachEntity(entity)
    DetachEntity(entity)
end

local function rollUp(player, model, text)
    local playcoords = GetEntityCoords(player)
    local entity = CreateObject(GetHashKey(model), playcoords.x, playcoords.y, playcoords.z, true, true, false)
    attachEntity(entity, player, 60309, 0.095, -0.003, 0.068, -37.0, 15.0, 45.0, 1, 1, 0, 0, 2, 1)
    if Config.ProgressBar == "Bar" then
        lib.progressBar({
            duration = 11000,
            label = 'Rollin Up '..text..'',
            useWhileDead = false,
            disable = { car = true },
            position = Config.ProgressLocation,
        })
    else
        lib.progressCircle({
            duration = 11000,
            label = 'Rollin Up '..text..'',
            useWhileDead = false,
            disable = { car = true },
            position = Config.ProgressLocation,
        })
    end
    detachEntity(entity)
    DeleteObject(entity)
end

RegisterNetEvent("dc_weed:rollupbackwood")
AddEventHandler("dc_weed:rollupbackwood", function(text)
    local player = PlayerPedId()
    requestModels()
    waitForModels()
    if not IsPedInAnyVehicle(player) then
        TaskPlayAnim(player, animDict, "rollingup_clip", 8.0, -8, -1, 49, 0, 0, 0, 0)
        rollUp(player, models.backwood, text)
        ClearPedTasks(player)
        RemoveAnimDict(animDict)
    end
end)

RegisterNetEvent("dc_weed:rollupjoint")
AddEventHandler("dc_weed:rollupjoint", function(text)
    local player = PlayerPedId()
    requestModels()
    waitForModels()
    if not IsPedInAnyVehicle(player) then
        TaskPlayAnim(player, animDict, "rollingup_clip", 8.0, -8, -1, 49, 0, 0, 0, 0)
        rollUp(player, models.rollpaper, text)
        ClearPedTasks(player)
        RemoveAnimDict(animDict)
    end
end)

RegisterNetEvent("dc_weed:notify")
AddEventHandler("dc_weed:notify", function(title, msg, ntype)
	lib.notify({
		title = title,
		description = msg,
		type = ntype
	})
end)