ITEM.name = "Tokarev TT-33"
ITEM.description= "An old semi-automatic handgun. Fires 7.62x25mm."
ITEM.longdesc = "The TT-30 is a Russian semi-automatic pistol.\nIt was developed in the early 1930s by Fedor Tokarev as a service pistol for the Soviet military to replace the Nagant M1895 revolver that had been in use since Tsarist times, though it ended up being used in conjunction with rather than replacing the M1895.\nIt served until 1952, when it was replaced by the Makarov pistol.\n\nAmmo: 7.62x25mm \nMagazine Capacity: 8"
ITEM.model = ("models/weapons/w_pist_tt38.mdl")
ITEM.class = "cw_tokarev"
ITEM.weaponCategory = "secondary"
ITEM.price = 800
ITEM.width = 2
ITEM.height = 1
ITEM.busflag = {"guns1"}
ITEM.repairCost = ITEM.price/100*1

ITEM.canAttach = false

ITEM.iconCam = {
	pos = Vector(-0.5, 200, -1.7000000476837),
	ang = Angle(0, 270, 0),
	fov = 4,
}

ITEM.pacData = {
[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["Model"] = "models/weapons/w_pist_tt38.mdl",
						["ClassName"] = "model",
						["Position"] = Vector(-7.5, 0.10999999940395, 2.4000000953674),
						["AngleOffset"] = Angle(0, -10.5, 0),
						["EditorExpand"] = true,
						["UniqueID"] = "3546344651",
						["Bone"] = "pelvis",
						["Name"] = "tt38",
						["Angles"] = Angle(0, 90, 0),
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "1563412402",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_tokarev@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "835841183",
		["EditorExpand"] = true,
	},
},
}