ITEM.name = "AR15 9mm"
ITEM.description= "An American combat rifle chambered for 9x19mm."
ITEM.longdesc = "PLACEHOLDER.\n\nAmmo: 5.56x45mm\nMagazine Capacity: 20"
ITEM.model = ("models/cw2/weapons/w_cam_m49m.mdl")
ITEM.class = "cw_ar159mm"
ITEM.weaponCategory = "primary"
ITEM.price = 18000
ITEM.width = 3
ITEM.height = 2
--ITEM.busflag = {"ARMS1_3", "SPECIAL5_1"}
ITEM.repairCost = ITEM.price/100*1
ITEM.validAttachments = {"md_microt1","md_eotech","md_aimpoint","md_cmore","md_schmidt_shortdot","md_acog","md_reflex","md_tundra9mm"}

ITEM.bulletweight = 0.008
ITEM.unloadedweight = 2.9

function ITEM:GetWeight()
  return self.unloadedweight + (self.bulletweight * self:GetData("ammo", 0))
end

ITEM.iconCam = {
	pos = Vector(8.5, -205, 1),
	ang = Angle(0, 90, 0),
	fov = 7.8,
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
						["Angles"] = Angle(0, 180, 180),
						["Position"] = Vector(16.543, -4.312, -1.374),
						["Model"] = "models/cw2/weapons/w_cam_m49m.mdl",
						["ClassName"] = "model",
						["EditorExpand"] = true,
						["UniqueID"] = "84124125421",
						["Bone"] = "spine 2",
						["Name"] = "m49mm",
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "10574123672",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_ar159mm@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "87314251483",
		["EditorExpand"] = true,
	},
},
}