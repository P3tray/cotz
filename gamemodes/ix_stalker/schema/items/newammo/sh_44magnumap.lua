ITEM.name = ".44 Magnum Armor-Piercing"
ITEM.model = "models/lostsignalproject/items/ammo/357.mdl"
ITEM.ammo = ".44 Magnum -AP-" // type of the ammo
ITEM.ammoAmount = 60 // amount of the ammo
ITEM.description= "A box that contains %s rounds of Armor-Piercing .44 Magnum ammo. "
ITEM.longdesc = "This large-bore .44 Magnum cartridge was originally designed for revolvers, but quickly adopted by rifles and carbines."
ITEM.price = 1000
ITEM.width = 2
ITEM.img = Material("vgui/hud/44magnumzl.png")

ITEM.weight = 0.017
ITEM.flatweight = 0.03

function ITEM:GetWeight()
  return self.flatweight + (self.weight * self:GetData("quantity", self.ammoAmount))
end