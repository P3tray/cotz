ITEM.name = "Scouting Binoculars"
ITEM.description = "A modern pair of binoculars. Features multiple zoom levels."
ITEM.model = "models/weapons/w_binoculars_usa.mdl"

ITEM.height = 1
ITEM.width = 1
ITEM.price = 20000

ITEM.weight = 0.640

ITEM.weaponCategory = "Binoculars"
ITEM.class = "weapon_rpw_binoculars_scout"
ITEM.canAttach = false

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(-15, -3, -1.5),
	ang = Angle(0, -0, 0),
	fov = 45,
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
						["Angles"] = Angle(120, 90, 0),
						["Position"] = Vector(-5, 3, -9.188),
						["Model"] = "models/weapons/w_binoculars_usa.mdl",
						["ClassName"] = "model",
						["EditorExpand"] = true,
						["UniqueID"] = "79792946733",
						["Bone"] = "pelvis",
						["Name"] = "binoculars",
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "12344865223",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "weapon_rpw_binoculars_scout@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "22127963483",
		["EditorExpand"] = true,
	},
},
}

function ITEM:PopulateTooltipIndividual(tooltip)
    ix.util.PropertyDesc2(tooltip, "Binoculars", Color(64, 224, 208), Material("vgui/ui/stalker/weaponupgrades/handling.png"))
end