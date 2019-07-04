-- See LICENSE for terms

local options
local mod_SkipDelete

-- fired when settings are changed/init
local function ModOptions()
	mod_SkipDelete = options.SkipDelete
end

-- load default/saved settings
function OnMsg.ModsReloaded()
	options = CurrentModOptions
	ModOptions()
end

-- fired when option is changed
function OnMsg.ApplyModOptions(id)
	if id ~= "ChoGGi_EmptyMechDepot" then
		return
	end

	ModOptions()
end

local Strings = ChoGGi.Strings

function OnMsg.ClassesPostprocess()

	-- list controlled buildings
	ChoGGi.ComFuncs.AddXTemplate("EmptyMechDepot", "sectionStorage", {
		__context_of_kind = "MechanizedDepot",
		Icon = "UI/Icons/Sections/storage.tga",
		Title = Strings[302535920000176--[[Empty Mech Depot]]],
		RolloverTitle = Strings[302535920000176--[[Empty Mech Depot]]],
		RolloverText = Strings[302535920000177--[[Empties out selected/moused over mech depot into a small depot in front of it.]]],
		OnContextUpdate = function(self, context)
			if context.stockpiled_amount > 0 then
				self:SetVisible(true)
				self:SetMaxHeight()
			else
				self:SetVisible(false)
				self:SetMaxHeight(0)
			end
		end,
		func = function(_, context)
			ChoGGi.ComFuncs.EmptyMechDepot(context, mod_SkipDelete)
		end,
	}, true)

end
