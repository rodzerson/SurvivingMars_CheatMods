-- See LICENSE for terms

if not g_AvailableDlc.gagarin then
	print("Change Skin Wasp Drones needs DLC Installed: Space Race!")
	return
end

local skins = {}
local c = 0
local EntityData = EntityData
for key in pairs(EntityData) do
	if key:find("DroneJapanFlying") then
		c = c + 1
		skins[c] = key
	end
end

function FlyingDrone:GetSkins()
	return skins
end
