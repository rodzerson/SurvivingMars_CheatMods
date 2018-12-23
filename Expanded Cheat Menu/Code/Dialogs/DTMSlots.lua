-- See LICENSE for terms

-- displays texture info

local S

function OnMsg.ClassesGenerate()
	S = ChoGGi.Strings
end

DefineClass.ChoGGi_DTMSlotsDlg = {
	__parents = {"ChoGGi_Window"},

	dialog_width = false,
	dialog_height = false,
	title = 302535920001486--[[DTM Slots--]],
}

function ChoGGi_DTMSlotsDlg:Init(parent, context)
	local g_Classes = g_Classes

	local screen = UIL.GetScreenSize()
	self.dialog_width = screen:x() - 20 + 0.0
	self.dialog_height = screen:y() - 20 + 0.0

	-- By the Power of Grayskull!
	self:AddElements(parent, context)

	self.idInfo = g_Classes.ChoGGi_DialogSection:new({
		Id = "idInfo",
	}, self.idDialog)

	-- invis background
	self.idDialog:SetBackground(0)

	self:SetInitPos(context.parent)
end

function ChoGGi_DTMSlotsDlg:DrawContent()
  local l_dbgDrawSlots = UIL.l_dbgDrawSlots
  local levels = DTM.GetSlotLevels()
	local bbox = self.idInfo.content_box
  self:Invalidate()
  UIL.DrawSolidRect(bbox, 134217728)
  local s = hr.DTM_MaxSlotSize
  local i = 0
	local x,y = bbox:minxyz()
	local w,h = bbox:sizexyz()
	h = h / levels
  while s >= hr.DTM_MinSlotSize do
    local b = box(x,
			y + i * h,
			x + w,
			y + (i + 1) * h
		)
    l_dbgDrawSlots(b, s)
    s = s / 2
    i = i + 1
  end
end