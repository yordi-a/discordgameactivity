-- Ayyıldız RP
-- discord.gg/YedpcNB

Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(324203132287486101) -- AppId rastgele oluşturulmuştur. (siz kendiniz discord developers'dan alıp koymanız gerekmektedir)
		SetDiscordRichPresenceAsset('ayyildiz')
        SetDiscordRichPresenceAssetText('Özendiğiniz hayatı yaşatmaya geliyoruz..') 
        SetDiscordRichPresenceAssetSmall('discord')
        SetDiscordRichPresenceAssetSmallText('discord.gg/YedpcNB')
		Citizen.Wait(60)
	end
end)

Citizen.CreateThread(function()
	while true do
		local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
		if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		local playerCount = #GetActivePlayers()
		Citizen.Wait(15000)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.236936)
				if MPH > 50 then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				elseif MPH <= 50 and MPH > 0 then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				elseif MPH == 0 then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				else
					SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | Oyuncu: ".. playerCount .."/100 ")
			end
		end
	end
end)