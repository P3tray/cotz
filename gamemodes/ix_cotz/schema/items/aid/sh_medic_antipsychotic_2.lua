ITEM.name = "Chlorpromazine Tablets"
ITEM.description = "A small blister packet."
ITEM.longdesc = "Chlorpromazine is used by STALKERs as a protectant against psychic attacks on their minds from enemies such as the infamous Controller. It only works for a short while after ingesting."
ITEM.model = "models/lostsignalproject/items/medical/aqua_tabs.mdl"

ITEM.sound = "stalkersound/inv_eat_pills.mp3"

ITEM.width = 1
ITEM.height = 1
ITEM.price = 1100

ITEM.quantity = 8
ITEM.psyblock = 40 --40% psyblock

ITEM.weight = 0.005
ITEM.flatweight = 0.050

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 45),
	fov = 1.5,
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc(tooltip, "Medical", Color(64, 224, 208))
    ix.util.PropertyDesc(tooltip, "Psy Suppressor", Color(64, 224, 208))
end

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		item.player:AddBuff("buff_psysuppress", 180, { })
		item.player:AddBuff("buff_psyblock", 180, { amount = item.psyblock })
		ix.chat.Send(item.player, "iteminternal", "pops out a pill from the "..item.name.." package and swallows it.", false)

		quantity = quantity - 1

		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
		
		return true
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}