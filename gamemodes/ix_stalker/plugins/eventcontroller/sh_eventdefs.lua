/*
	PLUGIN.eventdefs["Zombie1"] = {
		entities = {
			{"npc_mutant_classiczombie", 6}, -- {ent_name, amount}
			{"npc_mutant_dog", 2},
		},
		items = {
			{"mp5", {["durability"] = 15}}, -- {nut_item uniqueID, data}
			{"mp5", {["durability"] = 60}},
		},
		props = {
			{"models/props_c17/oildrum001.mdl", 5}, -- {propmodel, amount}
			{"models/props_c17/oildrum002.mdl", 5},
		},
		ragdolls = {
			{"models/kleiner.mdl", 2, 1, "000000000"}, -- {ragdollmodel, amount, skingroup, bodygroups}
			{"models/kleiner.mdl", 3, 2, "000000000"},
		},
		loot = {
			{"kit_event", 1}, 
		},
		pdabroadcast = "Zombies have been spotted at %s, proceed with caution.",
		difficulty = {1},
		lootChance = 10, --percentage
	}
*/
--entities: spawns <amount> entities of the type listed
--items: spawns the listed items with the given data
--props: spawns <amount> props with the model listed
--ragdolls: spawns <amount> ragdolls and sets skin and bodygroup
--loot: like items, except each item has a chance to spawn


--[[-------------------------------------------------------------------------
dogs
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["Dog1"] = {
	entities = {
		{"npc_mutant_dog", 3},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A small pack of dogs have been spotted %s.",
	difficulty = {0},
	lootChance = 10,
}

PLUGIN.eventdefs["Dog2"] = {
	entities = {
		{"npc_mutant_dog", 3},
		{"npc_mutant_pseudodog", 1},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A small pack of dogs have been spotted %s.",
	difficulty = {0},
	lootChance = 15,
}

PLUGIN.eventdefs["Dog3"] = {
	entities = {
		{"npc_mutant_dog", 4},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A pack of dogs have been seen wandering %s aimlessly, be alert, stalker.",
	difficulty = {0,1},
	lootChance = 15,
}

PLUGIN.eventdefs["Dog4"] = {
	entities = {
		{"npc_mutant_dog", 4},
		{"npc_mutant_pseudodog", 1},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A pack of dogs have been seen wandering %s aimlessly, be alert, stalker.",
	difficulty = {0,1},
	lootChance = 20,
}

PLUGIN.eventdefs["Dog5"] = {
	entities = {
		{"npc_mutant_dog", 5},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "There are reports of dogs attacking stalkers %s, be careful, stalker.",
	difficulty = {1},
	lootChance = 20,
}

PLUGIN.eventdefs["Dog6"] = {
	entities = {
		{"npc_mutant_dog", 5},
		{"npc_mutant_pseudodog", 1},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "There are reports of dogs attacking stalkers %s, be careful, stalker.",
	difficulty = {1},
	lootChance = 25,
}

PLUGIN.eventdefs["Dog6"] = {
	entities = {
		{"npc_mutant_dog", 6},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A huge pack of dogs are occupying %s! Stay away from there, stalker.",
	difficulty = {1},
	lootChance = 25,
}

PLUGIN.eventdefs["Dog7"] = {
	entities = {
		{"npc_mutant_dog", 6},
		{"npc_mutant_pseudodog", 1},
	},
	loot = {
		{"kitevent_dog", 1}, 
	},
	pdabroadcast = "A huge pack of dogs are occupying %s! Stay away from there, stalker.",
	difficulty = {1},
	lootChance = 30,
}

--[[-------------------------------------------------------------------------
bloodsuckers
---------------------------------------------------------------------------]]

PLUGIN.eventdefs["bloodsucker1"] = {
	entities = {
		{"npc_mutant_bloodsucker", 1}, 
	},
	loot = {
		{"kitevent_bloodsucker", 1}, 
	},
	pdabroadcast = "There's been sightings of a bloodsucker %s, any stalkers brave enough to take them out?",
	difficulty = {10, 11},
	lootChance = 10,
}

PLUGIN.eventdefs["bloodsucker2"] = {
	entities = {
		{"npc_mutant_bloodsucker", 2}, 
	},
	loot = {
		{"kitevent_bloodsucker", 1}, 
	},
	pdabroadcast = "There's been sightings of a couple bloodsuckers %s, any stalkers brave enough to take them out?",
	difficulty = {10, 11},
	lootChance = 10, 
}

PLUGIN.eventdefs["bloodsucker3"] = {
	entities = {
		{"npc_mutant_bloodsucker", 3}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 1},
	},
	loot = {
		{"kitevent_bloodsucker", 1},
	},
	pdabroadcast = "A group of stalkers %s has been massacred by a small pack of bloodsuckers, be careful, stalkers.",
	difficulty = {10, 11},
	lootChance = 15, 
}

PLUGIN.eventdefs["bloodsucker4"] = {
	entities = {
		{"npc_mutant_bloodsucker", 4}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_bloodsucker", 1},
	},
	pdabroadcast = "A pack of bloodsuckers has been sighted %s, proceed with caution, stalker.",
	difficulty = {10},
	lootChance = 20, 
}


PLUGIN.eventdefs["bloodsucker5"] = {
	entities = {
		{"npc_mutant_bloodsucker", 5}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_bloodsucker", 1},
	},
	pdabroadcast = "A pack of bloodsuckers has been sighted %s, proceed with caution, stalker.",
	difficulty = {10},
	lootChance = 20, 
}

PLUGIN.eventdefs["bloodsucker6"] = {
	entities = {
		{"npc_mutant_bloodsucker", 6}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_bloodsucker", 1},
	},
	pdabroadcast = "A huge pack of vicious bloodsuckers are moving towards %s, stay away at all cost, if you value your life, stalker.",
	difficulty = {10},
	lootChance = 25, 
}

--[[-------------------------------------------------------------------------
rodents
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["rodent1"] = {
	entities = {
		{"npc_mutant_rodent", 4},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "There is a bit of a mice problem %s, exterminate them stalker.",
	difficulty = {0, 1, 10},
	lootChance = 10,
}

PLUGIN.eventdefs["rodent2"] = {
	entities = {
		{"npc_mutant_rodent", 5},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "There is a bit of a mice problem %s, exterminate them stalker.",
	difficulty = {1, 10},
	lootChance = 10,
}

PLUGIN.eventdefs["rodent3"] = {
	entities = {
		{"npc_mutant_rodent", 6},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "Rodents are being a menace %s, deal with them with caution, stalker.",
	difficulty = {1, 10},
	lootChance = 15,
}

PLUGIN.eventdefs["rodent4"] = {
	entities = {
		{"npc_mutant_rodent", 7},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "Rodents are being a menace %s, deal with them with caution, stalker.",
	difficulty = {1, 10},
	lootChance = 15,
}

PLUGIN.eventdefs["rodent5"] = {
	entities = {
		{"npc_mutant_rodent", 8},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "Rodents are overrunning %s, proceed with caution, stalker.",
	difficulty = {1, 10},
	lootChance = 20,
}

PLUGIN.eventdefs["rodent6"] = {
	entities = {
		{"npc_mutant_rodent", 9},
	},
	loot = {
		{"kitevent_rodent", 1}, 
	},
	pdabroadcast = "It seems %s is completely infested with swarms of rodents! Stay away, stalker!",
	difficulty = {1, 10},
	lootChance = 25,
}
--[[-------------------------------------------------------------------------
pseudogiants
---------------------------------------------------------------------------]]
/*
PLUGIN.eventdefs["pseudogiant1"] = {
	entities = {
		{"npc_mutant_pseudogiant", 1}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 3}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_pseudogiant", 1},
	},
	pdabroadcast = "A pseudogiant has been spotted %s! Stay away from there, stalker.",
	difficulty = {5},
	lootChance = 20, 
}

	PLUGIN.eventdefs["pseudogiant2"] = {
	entities = {
		{"npc_mutant_pseudogiant", 1},
		{"npc_mutant_rodent", 3}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 3}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_pseudogiant", 1},
	},
	pdabroadcast = "A pseudogiant has been spotted %s! Stay away from there, stalker.",
	difficulty = {5},
	lootChance = 20, 
}

	PLUGIN.eventdefs["pseudogiant3"] = {
	entities = {
		{"npc_mutant_pseudogiant", 2} 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 3}, 
		{"models/Gibs/HGIBS_spine.mdl", 3},
	},
	loot = {
		{"kitevent_pseudogiant", 1},
	},
	pdabroadcast = "Pseudogiants have been spotted %s! Evacuate the area for your safety, stalker.",
	difficulty = {5},
	lootChance = 30, 
}
*/
--[[-------------------------------------------------------------------------
boars
---------------------------------------------------------------------------]]


PLUGIN.eventdefs["boar1"] = {
	entities = {
		{"npc_mutant_boar", 2},
	},
	loot = {
		{"kitevent_boar", 1}, 
	},
	pdabroadcast = "A pair of boars are spotted %s, any stalkers up for boar stew should deal with them.",
	difficulty = {0,1,2},
	lootChance = 10,
}

PLUGIN.eventdefs["boar2"] = {
	entities = {
		{"npc_mutant_boar", 3},
	},
	loot = {
		{"kitevent_boar", 1}, 
	},
	pdabroadcast = "Wild boars have been disrupting stalker activity %s, try to wipe them out, stalker.",
	difficulty = {1,2},
	lootChance = 15,
}

PLUGIN.eventdefs["boar3"] = {
	entities = {
		{"npc_mutant_boar", 4},
	},
	loot = {
		{"kitevent_boar", 1}, 
	},
	pdabroadcast = "A pack of boars are running rampant %s, proceed with caution, stalker.",
	difficulty = {1,2},
	lootChance = 20,
}

PLUGIN.eventdefs["boar4"] = {
	entities = {
		{"npc_mutant_boar", 5},
	},
	loot = {
		{"kitevent_boar", 1}, 
	},
	pdabroadcast = "A group of boars are frenzied and are killing everyone %s! Stay clear of the stampede, stalker.",
	difficulty = {1,2},
	lootChance = 25,
}

--[[-------------------------------------------------------------------------
chimeras
---------------------------------------------------------------------------]]

PLUGIN.eventdefs["chimera1"] = {
	entities = {
		{"npc_mutant_chimera", 1}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 1},
	},
	loot = {
		{"kitevent_pseudogiant", 1},
	},
	pdabroadcast = "Stalkers has reported a Chimera %s! Avoid them, stalkers.",
	difficulty = {5, 11},
	lootChance = 20, 
}

PLUGIN.eventdefs["chimera2"] = {
	entities = {
		{"npc_mutant_chimera", 1},
		{"npc_mutant_dog", 3}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_chimera", 1},
	},
	pdabroadcast = "Stalkers has reported a Chimera %s! Avoid them, stalkers.",
	difficulty = {5},
	lootChance = 20, 
}

--[[-------------------------------------------------------------------------
cats
---------------------------------------------------------------------------]]

PLUGIN.eventdefs["cat1"] = {
	entities = {
		{"npc_mutant_cat", 1} 
	},
	loot = {
		{"kitevent_cat", 1},
	},
	pdabroadcast = "A cat has been spotted %s just now. Be careful, stalker.",
	difficulty = {1, 2},
	lootChance = 10, 
}

PLUGIN.eventdefs["cat2"] = {
	entities = {
		{"npc_mutant_cat", 1} 
	},
	ragdolls = {
		{"models/crow.mdl", 2, 0, "000000000"},
	},
	loot = {
		{"kitevent_cat", 1},
	},
	pdabroadcast = "A cat has been spotted %s just now, chasing some birds. Take care, stalker.",
	difficulty = {1, 2},
	lootChance = 10, 
}

PLUGIN.eventdefs["cat3"] = {
	entities = {
		{"npc_mutant_cat", 2} 
	},
	ragdolls = {
		{"models/crow.mdl", 2, 0, "000000000"},
	},
	loot = {
		{"kitevent_cat", 1},
	},
	pdabroadcast = "A pair of cats have been spotted %s just now, playing around. Don't mistake them for pettable, stalker.",
	difficulty = {2},
	lootChance = 15, 
}

--[[-------------------------------------------------------------------------
hoverstones
---------------------------------------------------------------------------]]

PLUGIN.eventdefs["hoverstones1"] = {
	entities = {
		{"anom_hoverstone", 2}, 
	},
	loot = {
		{"jellyfish", 1},
		{"droplet", 1},
	},
	pdabroadcast = "Hoverstones has been spotted %s, don't bump your head walking into one.",
	difficulty = {0, 1},
	lootChance = 2, 
}

PLUGIN.eventdefs["hoverstones2"] = {
	entities = {
		{"anom_hoverstone", 2},
		{"npc_mutant_classiczombie", 2}, 
	},
	loot = {
		{"jellyfish", 1},
		{"droplet", 1},
	},
	pdabroadcast = "Hoverstones has been spotted %s, don't bump your head walking into one.",
	difficulty = {0, 1},
	lootChance = 5, 
}


PLUGIN.eventdefs["hoverstones3"] = {
	entities = {
		{"anom_hoverstone", 2},
		{"npc_mutant_dog", 2}, 
	},
	loot = {
		{"jellyfish", 1},
		{"droplet", 1},
	},
	pdabroadcast = "Hoverstones has been spotted %s, don't bump your head walking into one.",
	difficulty = {0, 1},
	lootChance = 5, 
}

--[[-------------------------------------------------------------------------
Izloms
---------------------------------------------------------------------------]]
/*PLUGIN.eventdefs["izlom1"] = {
	entities = {
		{"npc_mutant_izlom", 1}, 
	},
	loot = {
		{"kitevent_izlom", 1},
	},
	pdabroadcast = "One of those long-limbed Izloms has been seen %s.",
	difficulty = {2},
	lootChance = 10, 
}

PLUGIN.eventdefs["izlom2"] = {
	entities = {
		{"npc_mutant_izlom", 2}, 
	},
	loot = {
		{"kitevent_izlom", 1},
	},
	pdabroadcast = "A pair of Izloms have just been seen %s.",
	difficulty = {3},
	lootChance = 15, 
}

PLUGIN.eventdefs["izlom2"] = {
	entities = {
		{"npc_mutant_izlom", 2}, 
	},
	ragdolls = {
		{"models/crow.mdl", 1, 0, "000000000"},
	},
	loot = {
		{"kitevent_izlom", 1},
	},
	pdabroadcast = "Just saw a pair of those hunchbacked izloms eat a crow %s.",
	difficulty = {3},
	lootChance = 15, 
}
*/
--[[-------------------------------------------------------------------------
Controllers
---------------------------------------------------------------------------]]
/*PLUGIN.eventdefs["controller1"] = {
	entities = {
		{"npc_mutant_controller", 1}, 
	},
	loot = {
		{"kitevent_controller", 1},
	},
	pdabroadcast = "A controller has been spotted %s! Don't get tricked by their mind games. stalker",
	difficulty = {4},
	lootChance = 10, 
}

PLUGIN.eventdefs["controller2"] = {
	entities = {
		{"npc_mutant_controller", 1},
		{"npc_mutant_classiczombie", 3}, 
	},
	ragdolls = {
		{"models/stalkertnb/zombie2.mdl", 1, 0, "000000000"}, 
	},
	props = {
		{"models/Gibs/HGIBS.mdl", 1}, 
		{"models/Gibs/HGIBS_spine.mdl", 2},
	},
	loot = {
		{"kitevent_controller", 1},
		{"kit_stalkercrate001", 1},
	},
	pdabroadcast = "A controller has been spotted %s! Don't get tricked by their mind games. stalker",
	difficulty = {4},
	lootChance = 15, 
}

PLUGIN.eventdefs["controller3"] = {
	entities = {
		{"npc_mutant_controller", 2},
		{"npc_mutant_classiczombie", 5}, 
	},
	ragdolls = {
		{"models/stalkertnb/zombie2.mdl", 1, 0, "000000000"},
	},
	loot = {
		{"kitevent_controller", 1},
		{"kit_stalkercrate001", 1},
		{"kit_stalkercrate002", 1},
	},
	pdabroadcast = "Multiple controllers has been spotted %s! Get out of their range, stalkers.",
	difficulty = {4},
	lootChance = 20, 
}*/

--[[-------------------------------------------------------------------------
Psydogs
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["psydog1"] = {
	entities = {
		{"npc_mutant_psydog", 1}, 
	},
	loot = {
		{"kitevent_psydog", 1},
	},
	pdabroadcast = "A psydog has been reported deceiving stalkers %s, don't get too close, stalker.",
	difficulty = {11, 4, 5},
	lootChance = 10, 
}

PLUGIN.eventdefs["psydog2"] = {
	entities = {
		{"npc_mutant_psydog", 1}, 
	},
	loot = {
		{"kitevent_psydog", 1},
	},
	pdabroadcast = "A psydog has been reported feasting on a dead stalker %s, don't add a body for it to eat, stalker",
	difficulty = {11, 4, 5},
	lootChance = 15, 
}

PLUGIN.eventdefs["psydog3"] = {
	entities = {
		{"npc_mutant_psydog", 1}, 
		{"npc_mutant_pseudodog", 2}, 
	},

	loot = {
		{"kitevent_psydog", 1},
	},
	pdabroadcast = "A psydog has been reported feasting on a dead stalker %s, don't let it feast on another, stalker",
	difficulty = {11, 4, 5},
	lootChance = 20, 
}

--[[-------------------------------------------------------------------------
Burers
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["burer1"] = {
	entities = {
		{"npc_mutant_burer", 1}, 
	},
	loot = {
		{"kitevent_burer", 1},
	},
	pdabroadcast = "A burer has been spotted %s! Watch out for any figure in a trenchcoat, stalker.",
	difficulty = {11},
	lootChance = 10, 
}

PLUGIN.eventdefs["burer2"] = {
	entities = {
		{"npc_mutant_burer", 1}, 
		{"npc_mutant_classiczombie", 2}, 
	},
	loot = {
		{"kitevent_controller", 1},
	},
	pdabroadcast =  "A burer has been spotted %s! Watch out for any figure in a trenchcoat, stalker.",
	difficulty = {11},
	lootChance = 15, 
}

PLUGIN.eventdefs["burer3"] = {
	entities = {
		{"npc_mutant_burer", 3}, 
	},

	loot = {
		{"kitevent_burer", 1},
	},
	pdabroadcast = "A trio of burers has been spotted %s! Avoid any hooded figures, stalkers.",
	difficulty = {11},
	lootChance = 20, 
}

--[[-------------------------------------------------------------------------
Fleshes
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["flesh2"] = {
	entities = {
		{"npc_mutant_flesh", 2}, 
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "A few flesh were spotted %s, up for an easy hunt, stalker?.",
	difficulty = {0, 1},
	lootChance = 10, 
}

PLUGIN.eventdefs["flesh2"] = {
	entities = {
		{"npc_mutant_flesh", 3}, 
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "A few flesh were spotted %s, up for an easy hunt, stalker?.",
	difficulty = {0, 1},
	lootChance = 10, 
}

PLUGIN.eventdefs["flesh3"] = {
	entities = {
		{"npc_mutant_flesh", 4}, 
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "A small pack of flesh are wandering %s, we could always use more food, stalker.",
	difficulty = {0, 1, 2},
	lootChance = 15, 
}

PLUGIN.eventdefs["flesh4"] = {
	entities = {
		{"npc_mutant_flesh", 5}, 
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "A small pack of flesh are wandering %s, we could always use more food, stalker.",
	difficulty = {0, 1, 2},
	lootChance = 15, 
}

PLUGIN.eventdefs["flesh5"] = {
	entities = {
		{"npc_mutant_flesh", 5}, 
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "There has been sightings of aggressive fleshes %s, somebody put them down.",
	difficulty = {0, 1, 2},
	lootChance = 20, 
}

PLUGIN.eventdefs["flesh6"] = {
	entities = {
		{"npc_mutant_flesh", 5}, 
		{"npc_mutant_boar", 1},
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "There has been sightings of aggressive fleshes %s, somebody put them down.",
	difficulty = {1,2},
	lootChance = 20, 
}

PLUGIN.eventdefs["flesh7"] = {
	entities = {
		{"npc_mutant_flesh", 6}, 
		{"npc_mutant_boar", 1},
	},
	loot = {
		{"kitevent_flesh", 1},
	},
	pdabroadcast = "A big pack of fleshes are being quite violent %s, be on the lookout, stalker.",
	difficulty = {1,2},
	lootChance = 25, 
}


--[[-------------------------------------------------------------------------
Snorks
---------------------------------------------------------------------------]]

PLUGIN.eventdefs["snork1"] = {
	entities = {
		{"npc_mutant_snork", 1}, 
	},
	loot = {
		{"kitevent_snork", 1},
	},
	pdabroadcast = "A snork has been sneaking about %s, careful stalker.",
	difficulty = {10, 2, 3},
	lootChance = 10, 
}

PLUGIN.eventdefs["snork2"] = {
	entities = {
		{"npc_mutant_snork", 2}, 
	},
	loot = {
		{"kitevent_snork", 1},
	},
	pdabroadcast = "A couple of snorks have been heard growling %s, careful stalker.",
	difficulty = {11, 3},
	lootChance = 15, 
}

PLUGIN.eventdefs["snork3"] = {
	entities = {
		{"npc_mutant_snork", 3}, 
	},
	loot = {
		{"kitevent_snork", 1},
	},
	pdabroadcast = "A small group of snorks have been seen prowling %s, careful stalker.",
	difficulty = {11, 3, 4},
	lootChance = 20, 
}

PLUGIN.eventdefs["snork4"] = {
	entities = {
		{"npc_mutant_snork", 4}, 
	},
	loot = {
		{"kitevent_snork", 1},
	},
	pdabroadcast = "A small group of snorks have been seen watching over a dead stalker, %s, careful stalker.",
	difficulty = {11, 3, 4},
	lootChance = 25, 
}

--[[-------------------------------------------------------------------------
Zombies
---------------------------------------------------------------------------]]
PLUGIN.eventdefs["zombies1"] = {
	entities = {
		{"npc_mutant_classiczombie", 3}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "There has been sightings of a few zombies %s, put them out of their misery, stalker.",
	difficulty = {10, 0, 1},
	lootChance = 10, 
}

PLUGIN.eventdefs["zombies2"] = {
	entities = {
		{"npc_mutant_classiczombie", 4}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "A small group of zombies have appeared %s, watch yourself, stalker.",
	difficulty = {10, 1},
	lootChance = 15, 
}

PLUGIN.eventdefs["zombies3"] = {
	entities = {
		{"npc_mutant_classiczombie", 5}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "A small group of zombies have appeared %s, watch yourself, stalker.",
	difficulty = {10, 1},
	lootChance = 15, 
}

PLUGIN.eventdefs["zombies4"] = {
	entities = {
		{"npc_mutant_classiczombie", 6}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "There is a group of zombies %s, and has occupied it. Tread with caution, stalker.",
	difficulty = {10, 1, 2},
	lootChance = 20, 
}

PLUGIN.eventdefs["zombies5"] = {
	entities = {
		{"npc_mutant_classiczombie", 7}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "There is a group of zombies %s, and has occupied it. Tread with caution, stalker.",
	difficulty = {10, 1, 2},
	lootChance = 20, 
}

PLUGIN.eventdefs["zombies6"] = {
	entities = {
		{"npc_mutant_classiczombie", 8}, 
	},
	loot = {
		{"kitevent_zombie", 1},
	},
	pdabroadcast = "A horde of zombies are overrunning %s! Stay away, stalker.",
	difficulty = {10, 1, 2},
	lootChance = 25, 
}

--[[-------------------------------------------------------------------------
Supplyboxes and kits spawn here
---------------------------------------------------------------------------]]
/*
PLUGIN.eventdefs["crate1"] = {
	loot = {
		{"kit_weaponcrate003", 1},
	},
	pdabroadcast = "I saw this suspicious looking crate %s!",
	difficulty = {1},
	lootChance = 75, 
}
*/