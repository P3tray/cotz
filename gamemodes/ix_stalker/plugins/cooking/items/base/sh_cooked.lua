ITEM.name = "Cooked Consumable"
ITEM.description = "Consumable that has been cooked."
ITEM.category = "Cooked Meat"
ITEM.model = "models/props/cs_office/Cardboard_box02.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.weight = 0 --make sure you set this
ITEM.WeightPerThirst = -0.25
ITEM.WeightPerHunger = 0.5

function ITEM:GetThirst()
	return self:GetWeight()/self.WeightPerThirst
end

function ITEM:GetHunger()
	return self:GetWeight()/self.WeightPerHunger
end

function ITEM:PopulateTooltip(tooltip)
    if !self.entity then
        ix.util.PropertyDesc(tooltip, "Zone-Cooked", Color(255, 255, 0))
    end

    if (self.PopulateTooltipIndividual) then
      self:PopulateTooltipIndividual(tooltip)
    end
end

ITEM.functions.use = {
	name = "Eat",
	icon = "icon16/stalker/eat.png",
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end,
	OnRun = function(item)
		local hunger = item.player:GetCharacter():GetData("hunger", 100)
		local thirst = item.player:GetCharacter():GetData("thirst", 100)
		local client = item.player

		ix.util.PlayerPerformBlackScreenAction(item.player, "Eating", 5, function(player) 
			player:SetHunger(hunger + item:GetHunger())
			player:SetThirst(thirst + item:GetThirst())
		end)

		item.player:UpdateHungerState(item.player)

		return true
	end
}