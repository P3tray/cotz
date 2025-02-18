ITEM.name = "Elastic Bandage"
ITEM.description = "A small bandage for wounds."
ITEM.longdesc = "A normal elastic bandage used to stop bleeding and prevent infection of wounds. For regular bleeding, carefully apply the bandage to the wound. For arterial bleeding, urgently tie the bandage around the affected area."
ITEM.model = "models/lostsignalproject/items/medical/bandage.mdl"
ITEM.width = 1
ITEM.height = 1

ITEM.restore = 20
ITEM.quantity = 5

ITEM.sound = "stalkersound/inv_bandage_2p9.mp3"
ITEM.price = 80
ITEM.weight = 0.010

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 45),
	fov = 2.5,
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc(tooltip, "Medical", Color(64, 224, 208))
end

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)

		
		ix.chat.Send(item.player, "iteminternal", "unwraps and ties a "..item.name.." to their wound.", false)
		ix.util.PlayerPerformBlackScreenAction(item.player, "Wrapping Bandages", 4, function(player) 
			player:AddBuff("buff_slowheal", 4, { amount = item.restore/4 })
			--player:HealBleeding(50)
		end)
		local quantity = item:GetData("quantity", item.quantity)
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

/*
ITEM.functions.usetarget = {
	name = "Heal Target",
	icon = "icon16/stalker/heal.png",
	onRun = function(item)
		local data = {}
			data.start = item.player:GetShootPos()
			data.endpos = data.start + item.player:GetAimVector()*96
			data.filter = item.player
		local target = util.TraceLine(data).Entity
		local quantity = item:getData("quantity", item.quantity)
		if (IsValid(target) and target:IsPlayer()) then
			target:AddBuff("buff_slowheal", 5, { amount = item.restore*(1+(item.player:getChar():getAttrib("medical", 0)/50))/10 })
			nut.chat.send(item.player, "iteminternal", "opens a "..item.name.." and uses it on "..target:Name()..".", false)
			
			quantity = quantity - 1

			if (quantity >= 1) then
				item:setData("quantity", quantity)
				return false
			end
			
			
		else
			item.player:notify("Not looking at a player!")
			return false
		end

		return true
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}
*/