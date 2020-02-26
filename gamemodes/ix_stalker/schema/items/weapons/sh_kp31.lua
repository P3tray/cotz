ITEM.name = "KP-31"
ITEM.description= "A submachinegun chambered for 9x19mm."
ITEM.longdesc = "The Suomi KP-31 is regarded by many as one of the most successful submachine guns of World War II. It also had a profound effect on that conflict beyond Finland as the Soviet authorities, who had been dismissive of sub-machine guns, were persuaded of their deadly efficiency by the Finns after they attacked them in 1939.\n\nAmmo: 9x19mm \nMagazine Capacity: 30"
ITEM.model = ("models/khrcw2/doipack/w_suomi.mdl")
ITEM.class = "cw_kp31"
ITEM.weaponCategory = "primary"
ITEM.price = 9600
ITEM.width = 4
ITEM.height = 2
ITEM.busflag = {"guns3_1"}
ITEM.repairCost = ITEM.price/100*1
ITEM.validAttachments = {"md_tundra9mm"}

ITEM.iconCam = {
	pos = Vector(-6, 200, -1),
	ang = Angle(0, 270, 0),
	fov = 13,
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
						["Angles"] = Angle(0, 0, 180),
						["Position"] = Vector(11.662, -4.309, -2.877),
						["Model"] = "models/khrcw2/doipack/w_suomi.mdl",
						["ClassName"] = "model",
						["EditorExpand"] = true,
						["UniqueID"] = "8883938491",
						["Bone"] = "spine 2",
						["Name"] = "sterling",
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "1044336402",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_sterling@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "8134421183",
		["EditorExpand"] = true,
	},
},
}