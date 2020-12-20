ITEM.name = ".500 Magnum"
ITEM.model = "models/items/ammo_500sw.mdl"
ITEM.ammo = ".500 Magnum" // type of the ammo
ITEM.ammoAmount = 30 // amount of the ammo
ITEM.description= "A box that contains %s rounds of .500 Magnum ammo. "
ITEM.longdesc = "This high power cartridge was designed by Smith&Wesson, released in 2003, reclaiming the title of the worlds most powerful production handgun cartridge for Smith&Wesson. With pressures of up to 410MPa, this cartridge is designed for hunting big game, and the Zone's dangerous wildlife has endeared STALKERs to this cartridge."
ITEM.price = 1000
ITEM.busflag = {"ammo1_1"}
ITEM.width = 2
ITEM.img = Material("vgui/hud/44magnum.png")

ITEM.weight = 0.040
ITEM.flatweight = 0.03

function ITEM:GetWeight()
  return self.flatweight + (self.weight * self:GetData("quantity", self.ammoAmount))
end