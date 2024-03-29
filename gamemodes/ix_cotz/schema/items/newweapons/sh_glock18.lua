ITEM.name = "Glock 18"
ITEM.description= "An Austrian handgun that fires 9x19mm."
ITEM.longdesc = "The Glock is an Austrian polymer handgun, famous for it's price, reliability and trigger safety mechanism. The Glock 18 is a variant on the Glock 17 pattern, enabling it to fire in full auto.\nIt's favored by police agencies around the world and comes in many flavors.\n\nAmmo: 9x19mm\nMagazine Capacity: 17+1"
ITEM.model = "models/cw2_g18/w_dmg_glock.mdl"
ITEM.class = "cw_glock18"
ITEM.weaponCategory = "secondary"
ITEM.price = 6700
ITEM.width = 2
ITEM.height = 1

ITEM.validAttachments = {"md_tundra9mm"}

ITEM.bulletweight = 0.008
ITEM.unloadedweight = 0.625




function ITEM:GetWeight()
  return self.unloadedweight + (self.bulletweight * self:GetData("ammo", 0))
end

ITEM.iconCam = {
	pos = Vector(20, 0, -2.9000000953674),
	ang = Angle(0, 180, 5),
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
						["Model"] = "models/cw2_g18/w_dmg_glock.mdl",
						["ClassName"] = "model",
						["Position"] = Vector(-6.774, 4.172, 3.359),
						["EditorExpand"] = true,
						["UniqueID"] = "3547633835",
						["Bone"] = "pelvis",
						["Name"] = "glock18",
						["Angles"] = Angle(0, 180, 0),
					},
				},
			},
			["self"] = {
				["AffectChildrenOnly"] = true,
				["ClassName"] = "event",
				["UniqueID"] = "1640766402",
				["Event"] = "weapon_class",
				["EditorExpand"] = true,
				["Name"] = "weapon class find simple\"@@1\"",
				["Arguments"] = "cw_glock18@@0",
			},
		},
	},
	["self"] = {
		["ClassName"] = "group",
		["UniqueID"] = "1980487467",
		["EditorExpand"] = true,
	},
},
}