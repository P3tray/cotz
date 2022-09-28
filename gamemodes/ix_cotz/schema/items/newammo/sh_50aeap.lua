ITEM.name = ".50AE Armor-Piercing"
ITEM.model = "models/lostsignalproject/items/ammo/50cal_hs.mdl"
ITEM.ammo = ".50 AE -AP-" // type of the ammo
ITEM.ammoAmount = 60 // amount of the ammo
ITEM.description = ""
ITEM.quantdesc =  "A box that contains %s rounds of Armor-Piercing .50 AE ammo. "
ITEM.longdesc = "The .50 Action Express is a large caliber handgun cartridge. Developed in 1988 by American Evan Whildin of Action Arms, the .50 AE is one of the most powerful pistol cartridges in production."
ITEM.price = 1750
ITEM.img = ix.util.GetMaterial("cotz/icons/ammo/ammo_long_37_1.png")

ITEM.width = 2
ITEM.height = 1

ITEM.weight = 0.27
ITEM.flatweight = 0.05

function ITEM:GetWeight()
  return self.flatweight + (self.weight * self:GetData("quantity", self.ammoAmount))
end