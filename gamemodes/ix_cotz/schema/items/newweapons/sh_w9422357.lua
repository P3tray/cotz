ITEM.name = "Marlin 1894C .357 Magnum"
ITEM.description= "A classic lever-action rifle. Fires .357 Magnum."
ITEM.longdesc = "A modified Marlin brand rifle. It is a traditional lever-action with exposed hammer, straight grip, tube magazine and barrel bands.\n\nAmmo: .357 Magnum\nMagazine Capacity: 7"
ITEM.model = ("models/weapons/tfa_nmrih/w_fa_win1892.mdl")
ITEM.class = "cw_w9422357"
ITEM.weaponCategory = "primary"
ITEM.price = 21000
ITEM.width = 6
ITEM.height = 1
ITEM.validAttachments = {"md_microt1","md_eotech","md_aimpoint","md_cmore","md_schmidt_shortdot","md_reflex","md_nightforce_nxs","md_tundra9mm"}

ITEM.bulletweight = 0.019
ITEM.unloadedweight = 2.6

ITEM.repair_PartsComplexity = 3
ITEM.repair_PartsRarity = 3

function ITEM:GetWeight()
  return self.unloadedweight + (self.bulletweight * self:GetData("ammo", 0))
end

ITEM.iconCam = {
	pos = Vector(13, -205, 0),
	ang = Angle(0, 90, -0),
	fov = 11.5,
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
						["Position"] = Vector(15.528, -4.265, -3.556),
						["Model"] = "models/weapons/tfa_nmrih/w_fa_win1892.mdl",
						["ClassName"] = "model",
						["EditorExpand"] = true,
						["UniqueID"] = "235253253",
						["Bone"] = "spine 2",
						["Name"] = "w9422",
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "62424562456",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_w9422357@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "253523235",
		["EditorExpand"] = true,
	},
},
}