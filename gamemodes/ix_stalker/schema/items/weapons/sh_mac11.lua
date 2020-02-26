ITEM.name = "Mac-11"
ITEM.description= "A metal box of a submachinegun that fires 9x19mm"
ITEM.longdesc = "The MAC-11 is the milder alternative to the formidable MAC-10.\nIt's well known through the gangster world for it's cheap design capable of firing 20 rounds a second in full auto.\nIt uses an open-bolt design and features a charging handle safety known to malfunction at times.\n\nAmmo: 9x19mm\nMagazine Capacity: 32"
ITEM.model = "models/weapons/w_cst_mac11.mdl"
ITEM.class = "cw_mac11"
ITEM.weaponCategory = "secondary"
ITEM.width = 2
ITEM.price = 6000
ITEM.height = 2
ITEM.busflag = {"guns3"}
ITEM.repairCost = ITEM.price/100*1
ITEM.validAttachments = {"md_microt1","md_eotech","md_aimpoint","md_cmore","md_reflex","md_tundra9mm"}
ITEM.iconCam = {
	pos = Vector(-9.5, 10.5, 1.5),
	ang = Angle(0, 270, 3),
	fov = 70
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
						["Angles"] = Angle(0, -90, -30),
						["Position"] = Vector(-9.731, 10.516, -1.729),
						["Model"] = "models/weapons/w_cst_mac11.mdl",
						["ClassName"] = "model",
						["EditorExpand"] = true,
						["UniqueID"] = "79468794673",
						["Bone"] = "pelvis",
						["Name"] = "mac11",
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "1237478922",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_mac11@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "2787796348",
		["EditorExpand"] = true,
	},
},
}