ITEM.name = "Modafine Tablets"
ITEM.description = "A small blister packet."
ITEM.longdesc = "Modafine is a mixture of drugs consisting of a strong nerve agent as well as other stabilizing drugs, often used by STALKERs to cleanse their minds. Shortly after ingesting, a harsh physical discomfort will wash over the user. After the initial complications though, the ingesters mind will start clearing up."
ITEM.model = "models/lostsignalproject/items/medical/radioprotector.mdl"

ITEM.sound = "stalkersound/inv_eat_pills.mp3"

ITEM.width = 1
ITEM.height = 1
ITEM.price = 660

ITEM.quantity = 2
ITEM.psyheal = 50

ITEM.weight = 0.015
ITEM.flatweight = 0.010

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 45),
	fov = 1.5,
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc(tooltip, "Medical", Color(64, 224, 208))
    ix.util.PropertyDesc(tooltip, "Calms the Mind", Color(64, 224, 208))
end

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		item.player:AddBuff("buff_psyheal", 160, { amount = item.psyheal/320 })
		--item.player:AddBuff("debuff_psypillmovement", 15, {})
		item.player:TakeDamage(15, item.player, item.player)
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