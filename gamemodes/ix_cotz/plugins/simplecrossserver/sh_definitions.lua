--[[

	PLUGIN.mapdata[mapname] = {
		serverip = server ip,

		loadzones[loadzone] = {
		pos = Vector,
		ang = Angle,
		desc = description,
		}
	}
--]]



PLUGIN.mapdata["rp_marsh_cs"] = {}
PLUGIN.mapdata["rp_marsh_cs"].name = "Swamps"
PLUGIN.mapdata["rp_marsh_cs"].serverip = "80.161.55.20:27015"
PLUGIN.mapdata["rp_marsh_cs"].loadzones = PLUGIN.mapdata["rp_marsh_cs"].loadzones or {}

PLUGIN.mapdata["rp_marsh_cs"].loadzones["fromoutskirts"] = {
	pos = Vector(-5776.200684, 12873.084961, 192.307175), --edit me
	ang = Angle(12.539946, -143.615875, 0.000000), --edit me
	desc = "The area ahead leads to the swamps."
}

PLUGIN.mapdata["rp_marsh_cs"].loadzones["fromtraintracks"] = {
	pos = Vector(10233.159180, 12431.816406, 408.532898), --edit me
	ang = Angle(0, -132.842041, 0.000000), --edit me
	desc = "The area ahead leads to the swamps."
}

PLUGIN.mapdata["rp_marsh_cs"].loadzones["fromtrainbridge"] = {
	pos = Vector(-7737.101074, 12312.310547, 152.593567), --edit me
	ang = Angle(0, 0, 0.000000), --edit me
	desc = "The area ahead leads to the swamps."
}

PLUGIN.mapdata["rp_salvation_2_haven"] = {}
PLUGIN.mapdata["rp_salvation_2_haven"].name = "Farmlands"
PLUGIN.mapdata["rp_salvation_2_haven"].serverip = "80.161.55.20:27016"
PLUGIN.mapdata["rp_salvation_2_haven"].loadzones = PLUGIN.mapdata["rp_salvation_2_haven"].loadzones or {}

PLUGIN.mapdata["rp_salvation_2_haven"].loadzones["fromwaystation"] = {
	pos = Vector(2308.856201, 10894.163086, 197.129257), --edit me
	ang = Angle(3.531969, -144.119522, 0.000000), --edit me
	desc = "The area ahead leads to the Farmlands."
}
PLUGIN.mapdata["rp_salvation_2_haven"].loadzones["frommarsh"] = {
	pos = Vector(-10784.875000, -10971.215820, 61.031250), --edit me
	ang = Angle(0.000000, 180.0000, 0.000000), --edit me
	desc = "The area ahead leads to the Farmlands."
}


PLUGIN.mapdata["rp_waystation"] = {}
PLUGIN.mapdata["rp_waystation"].name = "Waystation"
PLUGIN.mapdata["rp_waystation"].serverip = "80.161.55.20:27017"
PLUGIN.mapdata["rp_waystation"].loadzones = PLUGIN.mapdata["rp_waystation"].loadzones or {}

PLUGIN.mapdata["rp_waystation"].loadzones["fromoutskirts"] = {
	pos = Vector(-8569.341797, 483.034058, 328.446228), --edit me
	ang = Angle(89.000000, 39.314655, 0.000000), --edit me
	desc = "Your geigercounter goes crazy as you approach. The area ahead is clearly irradiated."
}

PLUGIN.mapdata["rp_waystation"].loadzones["frommarsh"] = {
	pos = Vector(-11556.629883, -13154.640625, 96.031250), --edit me
	ang = Angle(0, 0, 0), --edit me
	desc = "Your geigercounter lights up as you approach. The area ahead is clearly irradiated."
}

PLUGIN.mapdata["rp_waystation"].loadzones["frompripyat"] = {
	pos = Vector(3341.026611, 13212.584961, 800.866943), --edit me
	ang = Angle(10.465063, -122.256470, 0.000000), --edit me
	desc = "Your geigercounter tones down a little as you approach. The area ahead is clearly irradiated."
}
