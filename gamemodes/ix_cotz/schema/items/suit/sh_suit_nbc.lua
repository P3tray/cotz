ITEM.name = "NBC Suit"
ITEM.model ="models/kek1ch/stalker_outfit.mdl"
ITEM.newModel = "models/nasca/stalker/male_nbc_lone.mdl"
ITEM.description= "An NBC Suit."
ITEM.longdesc = "This suit is a modified version of the standard Sunrise outfit, composed of a camouflaged CBRN suit with a Class II-a Kevlar vest. Favored by diggers and underground explorers."

ITEM.width = 2
ITEM.height = 3
ITEM.img = ix.util.GetMaterial("vgui/hud/nbc.png")
ITEM.overlayPath = "vgui/overlays/hud_gas"
ITEM.weight = 7.900

ITEM.price = 89000
ITEM.repairCost = ITEM.price/100*1 -- cost to repair from 0% durability

ITEM.isGasmask = true
ITEM.isHelmet = true

ITEM.br = 0.11
ITEM.fbr = 1
ITEM.sr = 0.18
ITEM.fsr = 1
ITEM.ar = 0.21
ITEM.far = 1
ITEM.pr = 0.10
ITEM.fpr = 0
ITEM.radProt = 0.4

ITEM.carryinc = 13.000
ITEM.miscslots = 3

ITEM.skincustom[1] = {
	name = "Skin 0",
	skingroup = 0,
}
ITEM.skincustom[2] = {
	name = "Skin 1",
	skingroup = 1,
}