
Citizen.CreateThread(function() 

  local vec = GetEntityCoords(PlayerPedId(-1)) 
  -- vehicle with SetVehicleModKit(vehicle, 0) set
  CreateTestVehicle('blista', vec, true)

  -- vehicle without it set
  CreateTestVehicle('blista', vec, false)

end)

function CreateTestVehicle(model, pos, bool)

	if not HasModelLoaded(model) and IsModelInCdimage(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(0)
		end
	end

	local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, 1, true, false)
	local id = NetworkGetNetworkIdFromEntity(vehicle)

	SetNetworkIdCanMigrate(id, true)
	SetEntityAsMissionEntity(vehicle, true, false)
	SetVehicleHasBeenOwnedByPlayer(vehicle, true)
	SetVehicleNeedsToBeHotwired(vehicle, false)
	SetModelAsNoLongerNeeded(model)
	SetVehRadioStation(vehicle, 'OFF')

  if bool then
    SetVehicleModKit(vehicle, 0)
	end

	RequestCollisionAtCoord(pos.x, pos.y, pos.z)
	while not HasCollisionLoadedAroundEntity(vehicle) do
		Wait(0)
	end

	return vehicle
end