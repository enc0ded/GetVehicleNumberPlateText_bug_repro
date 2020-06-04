
-- GetVehicleNumberPlateText() will return empty string on vehicles that had SetVehicleModKit(vehicle, 0) set clientside 
Citizen.CreateThread(function() 
  while true do 
    for i,v in ipairs(GetAllVehicles()) do
      print('Entity ID:', v, 'Vehicle Plate:', GetVehicleNumberPlateText(v))
    end
    Citizen.Wait(2000)
  end
end)