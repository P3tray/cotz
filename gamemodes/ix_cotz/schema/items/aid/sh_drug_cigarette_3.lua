ITEM.name = "'Star' Cigarettes (10pk)"
ITEM.description = "A pack of 'Star' brand cigarettes."
ITEM.longdesc = "'Star' (Звезда) brand cigarettes is a popular Russia produced cigarette, with a strong smell and great taste.\nA favourite of STALKERs, however the price is slightly higher than other regional brands."
ITEM.model = "models/lostsignalproject/items/consumable/cigarettes_star.mdl"

ITEM.sound = "stalkersound/inv_smoke.mp3"

ITEM.width = 1
ITEM.height = 1
ITEM.price = 430

ITEM.quantity = 10
ITEM.hunger = 5
ITEM.psyheal = 5

ITEM.flatweight = 0.010
ITEM.weight = 0.001

ITEM.addictionNicotine = true

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 1.2,
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc(tooltip, "Drug", Color(64, 224, 208))
	ix.util.PropertyDesc(tooltip, "Contains Nicotine", Color(64, 224, 208))
	ix.util.PropertyDesc(tooltip, "Calms the Mind", Color(64, 224, 208))
end

ITEM.functions.use = {
	name = "Smoke",
	icon = "icon16/stalker/smoke.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		ix.util.PlayerPerformBlackScreenAction(item.player, "Smoking", 6, function(player) 
			local hunger = player:GetCharacter():GetData("hunger", 100)
			player:AddBuff("buff_psyheal", 15, { amount = item.psyheal/30 })
			player:SetHunger(hunger + item.hunger)
		end)

		quantity = quantity - 1

		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
		
		ix.chat.Send(item.player, "iteminternal", "pulls out a "..item.name.." and smokes it.", false)

		return true
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.combine = {
	OnCanRun = function(item, data)
		if !data then
			return false
		end
		
		local targetItem = ix.item.instances[data[1]]

		if targetItem.uniqueID == item.uniqueID then
			return true
		else
			return false

		end
	end,
	OnRun = function(item, data)
		local targetItem = ix.item.instances[data[1]]
		local targetQuantDiff = targetItem.quantity - targetItem:GetData("quantity", targetItem.quantity)
		local localQuant = item:GetData("quantity", item.quantity)
		local targetQuant = targetItem:GetData("quantity", targetItem.quantity)
		item.player:EmitSound("stalkersound/inv_properties.mp3", 110)
		if targetQuantDiff >= localQuant then
			targetItem:SetData("quantity", targetQuant + localQuant)
			return true
		else
			item:SetData("quantity", localQuant - targetQuantDiff)
			targetItem:SetData("quantity", targetItem.quantity)
			return false
		end
	end,
}
