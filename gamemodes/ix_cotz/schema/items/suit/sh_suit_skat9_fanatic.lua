ITEM.name = "X-18 Armored Suit"
ITEM.model = "models/kek1ch/military_outfit.mdl"
ITEM.newModel = "models/stalkerisaac/playermodel/male_01_skat.mdl"
ITEM.description= "A military-grade body armor"
ITEM.longdesc = "This military armoured suit is designed for assault operations in anomalous areas. Has a built-in compensation suit, and an anomalous protection bodysuit. The armour provides excellent protection against bullet and fragmentation damage, without greatly reducing the wearer’s mobility."

ITEM.width = 2
ITEM.height = 3
ITEM.img = ix.util.GetMaterial("vgui/hud/skat.png")
ITEM.weight = 21.60
ITEM.newSkin = 17

ITEM.price = 490000
ITEM.repairCost = ITEM.price/100*1 -- cost to repair from 0% durability

ITEM.isGasmask = false
ITEM.isHelmet = false

ITEM.br = 0.35
ITEM.fbr = 4
ITEM.sr = 0.62
ITEM.fsr = 4
ITEM.ar = 0.22
ITEM.far = 3

ITEM.carryinc = 19.000
ITEM.miscslots = 2


ITEM.skincustom[1] = {
	name = "Skin 0",
	skingroup = 0,
}
ITEM.skincustom[2] = {
	name = "Skin 1",
	skingroup = 1,
}
