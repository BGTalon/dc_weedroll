RegisterNetEvent("dc_weed:rollupbackwood")
AddEventHandler("dc_weed:rollupbackwood", function(text)
	local player = PlayerPedId()
	local playcoords = GetEntityCoords(player)
	RequestModel("dc_backwood")
	RequestModel("dc_weednug")
	RequestModel("dc_backwoodlit")
	RequestAnimDict("custom@rollingupanim")
	while not HasAnimDictLoaded("custom@rollingupanim") or not HasModelLoaded("dc_backwood") or not HasModelLoaded("dc_weednug") or not HasModelLoaded("dc_backwoodlit") do
		Citizen.Wait(10)
	end
	if not IsPedInAnyVehicle(player) then
		local Wood = CreateObject(GetHashKey('dc_backwood'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		local Bud = CreateObject(GetHashKey('dc_weednug'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Wood, player, GetPedBoneIndex(player, 60309), 0.079, -0.01, 0.025, 0.0, 0.0, 1.0, 1, 1, 0, 0, 2, 1)
		AttachEntityToEntity(Bud, player, GetPedBoneIndex(player, 28422), 0.085, 0.02, -0.045, 0.0, 0.0, 1.0, 1, 1, 0, 0, 2, 1)
		TaskPlayAnim(player, "custom@rollingupanim", "rollingup_clip", 8.0, -8, -1, 49, 0, 0, 0, 0)
		lib.progressBar({
			duration = 9300,
			label = 'Sprinkling Weed',
			useWhileDead = false,
			disable = { car = true },
		})
		DeleteObject(Bud)
		DeleteObject(Wood)
		Wood = nil
		local Wood = CreateObject(GetHashKey('dc_backwood'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Wood, player, GetPedBoneIndex(player, 60309), 0.095, -0.003, 0.068, -37.0, 15.0, 45.0, 1, 1, 0, 0, 2, 1)
		lib.progressBar({
			duration = 11000,
			label = 'Rollin Up '..text..'',
			useWhileDead = false,
			disable = { car = true },
		})
		DeleteObject(Wood)
		local Blunt = CreateObject(GetHashKey('dc_backwoodlit'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Blunt, player, GetPedBoneIndex(player, 60309), 0.095, -0.003, 0.068, 70.0, 45.0, 45.0, 1, 1, 0, 0, 2, 1)
		lib.progressBar({
			duration = 3800,
			label = 'Finishing Up',
			useWhileDead = false,
			disable = { car = true },
		})
		DeleteObject(Blunt)
		ClearPedTasks(player)
		RemoveAnimDict("custom@rollingupanim")
	end
end)

RegisterNetEvent("dc_weed:rollupjoint")
AddEventHandler("dc_weed:rollupjoint", function(text)
	local player = PlayerPedId()
	local playcoords = GetEntityCoords(player)
	RequestModel("dc_rollpaper")
	RequestModel("dc_weednug")
	RequestModel("p_cs_joint_02")
	RequestAnimDict("custom@rollingupanim")
	while not HasAnimDictLoaded("custom@rollingupanim") or not HasModelLoaded("dc_rollpaper") or not HasModelLoaded("dc_weednug") or not HasModelLoaded("p_cs_joint_02") do
		Citizen.Wait(10)
	end
	if not IsPedInAnyVehicle(player) then
		local Paper = CreateObject(GetHashKey('dc_rollpaper'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		local Bud = CreateObject(GetHashKey('dc_weednug'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Paper, player, GetPedBoneIndex(player, 60309), 0.079, -0.01, 0.025, 0.0, 0.0, 1.0, 1, 1, 0, 0, 2, 1)
		AttachEntityToEntity(Bud, player, GetPedBoneIndex(player, 28422), 0.085, 0.02, -0.045, 0.0, 0.0, 1.0, 1, 1, 0, 0, 2, 1)
		TaskPlayAnim(player, "custom@rollingupanim", "rollingup_clip", 8.0, -8, -1, 49, 0, 0, 0, 0)
		lib.progressBar({
			duration = 9300,
			label = 'Sprinkling Weed',
			useWhileDead = false,
			disable = { car = true },
		})
		DeleteObject(Bud)
		DeleteObject(Paper)
		Paper = nil
		local Paper = CreateObject(GetHashKey('dc_rollpaper'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Paper, player, GetPedBoneIndex(player, 60309), 0.095, -0.003, 0.068, -37.0, 15.0, 45.0, 1, 1, 0, 0, 2, 1)
		lib.progressBar({
			duration = 11000,
			label = 'Rollin Up '..text..'',
			useWhileDead = false,
			disable = { car = true },
		})
		DetachEntity(Paper)
		DeleteObject(Paper)
		local Joint = CreateObject(GetHashKey('p_cs_joint_02'), playcoords.x, playcoords.y, playcoords.z, true, true, false)
		AttachEntityToEntity(Joint, player, GetPedBoneIndex(player, 60309), 0.095, -0.003, 0.068, 70.0, 45.0, 45.0, 1, 1, 0, 0, 2, 1)
		lib.progressBar({
			duration = 3800,
			label = 'Finishing Up',
			useWhileDead = false,
			disable = { car = true },
		})
		DetachEntity(Joint)
		DeleteObject(Joint)
		ClearPedTasks(player)
		RemoveAnimDict("custom@rollingupanim")
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