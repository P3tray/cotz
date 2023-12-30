ITEM.name = "Mercenary Exoskeleton"
ITEM.model = "models/kek1ch/exolight_outfit.mdl"
ITEM.newModel = "models/stalkerisaac/playermodel/male_01_radsuit.mdl"
ITEM.description= "An armored exoskeleton suit"
ITEM.longdesc = "TODO"

ITEM.width = 2
ITEM.height = 3
ITEM.img = ix.util.GetMaterial("vgui/hud/radsuit.png")
ITEM.weight = 34.50
ITEM.newSkin = 16

ITEM.price = 1810200
ITEM.repairCost = ITEM.price/100*1 -- cost to repair from 0% durability

ITEM.isGasmask = false
ITEM.isHelmet = false

ITEM.br = 0.47
ITEM.fbr = 6
ITEM.sr = 0.81
ITEM.fsr = 5
ITEM.ar = 0.25
ITEM.far = 2

ITEM.carryinc = 64.000
ITEM.miscslots = 3


ITEM.skincustom[1] = {
	name = "Skin 0",
	skingroup = 0,
}
ITEM.skincustom[2] = {
	name = "Skin 1",
	skingroup = 1,
}
