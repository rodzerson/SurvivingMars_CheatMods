-- not much point without it
if g_AvailableDlc.gagarin then
	local flag_spons = {}
	local EntityData = EntityData
	for key in pairs(EntityData) do
		if key:find("Flag_03_") then
			flag_spons[#flag_spons+1] = key:sub(9)
		end
	end

	local IsValidEntity = IsValidEntity
	local StringFormat = string.format
	function SponsorBannerBase:GetEntity()
		local entity = StringFormat("%s%s",self.banner,table.rand(flag_spons))
		if not IsValidEntity(entity) then
			entity = StringFormat("%sIMM",self.banner)
		end
		return entity

	end
end
