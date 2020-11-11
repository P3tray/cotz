ITEM.name = "12g Buckshot Zone-Loaded"
ITEM.model = "models/lostsignalproject/items/ammo/12x70.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.ammo = "12 Gauge -ZL-" // type of the ammo
ITEM.ammoAmount = 50 // amount of the ammo
ITEM.description= "A box that contains %s zone-loaded 12 gauge shells. "
ITEM.longdesc = "Standard 12 gauge shell filled with 6 mm shot. Highly lethal at close range. Only suitable for use with smoothbore weapons."
ITEM.price = 600
ITEM.img = Material("vgui/hud/12gaugezl.png")

ITEM.weight = 0.028
ITEM.flatweight = 0.03

function ITEM:GetWeight()
  return self.flatweight + (self.weight * self:GetData("quantity", self.ammoAmount))
end