ITEM.name = "Army Medkit"
ITEM.description = "A small military medkit."
ITEM.longdesc = "A specialized medical kit for providing first aid to combat casualties. The kit includes blood coagulants based on menadione, painkillers, antibiotics and immunostimulants."
ITEM.model = "models/lostsignalproject/items/medical/medical_bag_army.mdl"

ITEM.sound = "stalkersound/inv_bandage.mp3"

ITEM.width = 2
ITEM.height = 1
ITEM.price = 650

ITEM.quantity = 3
ITEM.restore = 75

ITEM.weight = 0.050
ITEM.flatweight = 0.250

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(-200, 0.5, 0.60000002384186),
	ang = Angle(0, -0, 90),
	fov = 5,
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc(tooltip, "Medical", Color(64, 224, 208))
end

ITEM.functions.use = {
	name = "Heal",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)

		ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it.", false)

		ix.util.PlayerPerformBlackScreenAction(item.player, "Treating Wounds", 8, function(player) 
			player:AddBuff("buff_slowheal", 60, { amount = item.restore/60 })
			--player:HealBleeding(60)
		end)

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

ITEM.functions.usetarget = {
	name = "Heal Target",
	icon = "icon16/stalker/heal.png",
	OnRun = function(item)
		local data = {}
			data.start = item.player:GetShootPos()
			data.endpos = data.start + item.player:GetAimVector()*96
			data.filter = item.player
		local target = util.TraceLine(data).Entity
		local quantity = item:GetData("quantity", item.quantity)
		if (IsValid(target) and target:IsPlayer()) then
			
			ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it on "..target:Name()..".", false)
			ix.util.PlayerPerformBlackScreenAction(item.player, "Treating "..target:Name().."'s Wounds", 4, function(player) 
				target:AddBuff("buff_slowheal", 60, { amount = item.restore/60 })
			end)
			
			ix.util.PlayerPerformBlackScreenAction(target, "Being treated by "..item.player:Name()..".", 4)

			quantity = quantity - 1

			if (quantity >= 1) then
				item:SetData("quantity", quantity)
				return false
			end
		elseif ( IsValid( target ) and target:GetClass( ) == "prop_ragdoll" ) then
			if ( target.isDeadBody ) then
				if not ( IsValid( target.player ) ) then
					item.player:Notify( "You cannot revive a disconnected player's body." )
					return false
				end

				target.player:UnSpectate()
				target.player:SetNetVar("resurrected", true)
				target.player:Spawn()
				target.player:SetHealth( 1 ) 
				target.player:SetPos(target:GetPos())
				item.player:Notify( "You revived "..target.player:GetName() )
				target.player:Notify( "You were revived by "..item.player:GetName() )

				target.player:AddBuff("buff_slowheal", 60, { amount = item.restore/60 })
				ix.chat.Send(item.player, "iteminternal", "opens a "..item.name.." and uses it on "..target.player:Name()..".", false)

				quantity = quantity - 1
				if (quantity >= 1) then
					item:SetData("quantity", quantity)
					return false
				end
			end
		else
			item.player:Notify("Not looking at a player!")
			return false
		end

		return true
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}