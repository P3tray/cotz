ITEM.name = "1.5 Volt Battery"
ITEM.description = "AA battery."
ITEM.longdesc = "Small AA batteries, often used for powering flashlights and other small electronic devices. Fetches a small price."
ITEM.model = "models/illusion/eftcontainers/aabattery.mdl"

ITEM.width = 1
ITEM.height = 1
ITEM.price = 46

ITEM.quantity = 20

ITEM.flatweight = 0
ITEM.weight = 0.023

function ITEM:GetPrice()
	return self.price * self:GetData("quantity", self.quantity)
end

ITEM.functions.combine = {
	OnCanRun = function(item, data)
		if !data then
			return false
		end
		local targetItem = ix.item.instances[data[1]]

		if targetItem.uniqueid == item.uniqueid then
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

function ITEM:OnInstanced()
	if (!self:GetData("quantity")) then
		self:SetData("quantity", math.random(1,6))
	end
end