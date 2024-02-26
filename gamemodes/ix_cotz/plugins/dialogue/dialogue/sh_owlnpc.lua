DIALOGUE.name = "Trader Test"

DIALOGUE.addTopic("GREETING", {
	response = "What is it?",
	options = {
		"TradeTopic",
		"StorageTopic",
		"BackgroundTopic",
		"InterestTopic",
		"AboutWorkTopic",
		-- "GetTask",
		"GetTaskByDifficulty",
		"AboutProgression",
		"StartBarter",
		"ChangeSuitVariant",
		"GOODBYE"
	},
	preCallback = function(self, client, target)
		-- Tasks
		-- netstream.Start("job_updatenpcjobs", target, target:GetDisplayName(), {"information", "riches", "bandits"}, 4)
		if (SERVER) then
			if target:GetNetVar("possibleJobs") == nil then
				local possibleJobs = {}
				possibleJobs["easy"] = {"stashpackagenpc_easy"}
				possibleJobs["medium"] = {"stashpackagenpc_medium"}
				possibleJobs["hard"] = {"stashpackagenpc_hard"}
	
				target:SetNetVar("possibleJobs", possibleJobs)
			end
		end
	end
})

DIALOGUE.addTopic("TradeTopic", {
	statement = "Want to trade?",
	response = "Yes",
	postCallback = function(self, client, target)
		if (SERVER) then
			local character = client:GetCharacter()

			target.receivers[#target.receivers + 1] = client

			local items = {}

			-- Only send what is needed.
			for k, v in pairs(target.items) do
				if (!table.IsEmpty(v) and (CAMI.PlayerHasAccess(client, "Helix - Manage Vendors", nil) or v[VENDOR_MODE])) then
					items[k] = v
				end
			end

			target.scale = target.scale or 0.5

			client.ixVendorAdv = target

			-- force sync to prevent outdated inventories while buying/selling
			if (character) then
				character:GetInventory():Sync(client, true)
			end

			net.Start("ixVendorAdvOpen")
				net.WriteEntity(target)
				net.WriteUInt(target.money or 0, 16)
				net.WriteTable(items)
				net.WriteFloat(target.scale or 0.5)
			net.Send(client)

			ix.log.Add(client, "vendorUse", target:GetDisplayName())
		end
	end,
	options = {
		"BackTopic",
	}
})



DIALOGUE.addTopic("StorageTopic", {
	statement = "Do you have room to store my items?",
	response = "Yes.",
	options = {
		"BackTopic"
	},
	preCallback = function(self, client, target)
		if !ix.progression.IsCompleted("cleanerItemDelivery_Storage") and CLIENT then
			self.response = "No, not for the moment."
		end
	end,
	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}
		local basecost = 120
		local bankW = client:GetCharacter():GetData("bankW", ix.config.Get("bankW", 3))
		local bankH = client:GetCharacter():GetData("bankH", ix.config.Get("bankH", 2))
		local heightcost = math.Round(math.pow(basecost + 300, 1+(bankH/4.5)))
		local widthcost = math.Round(math.pow(basecost, 1+(bankW/4.5)))

		table.insert(dynopts, {statement = "Can I please see my storage?", topicID = "StorageTopic", dyndata = {option = "use"}})

		if bankW < ix.config.Get("bankWMax") then
			table.insert(dynopts, {statement = "I want to upgrade the width. ("..ix.currency.Get(widthcost)..")", topicID = "StorageTopic", dyndata = {direction = "horizontally", cost = widthcost}})
		end
		if bankH < ix.config.Get("bankHMax") then
			table.insert(dynopts, {statement = "I want to upgrade the height. ("..ix.currency.Get(heightcost)..")", topicID = "StorageTopic", dyndata = {direction = "vertically", cost = heightcost}})
		end
		
		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		if (dyndata.option == "use") then
			return "OpenStorage"
		end

		if( !client:GetCharacter():HasMoney(dyndata.cost)) then
			return "NotEnoughMoneyStorage"
		end

		-- Return the next topicID
		return "ConfirmStorageUpgrade", {direction = dyndata.direction, cost = dyndata.cost}
	end,
	ShouldAdd = function()
		if (ix.progression.IsCompleted("cleanerItemDelivery_Storage")) then
			return true
		end
	end
})

DIALOGUE.addTopic("OpenStorage", {
	statement = "",
	response = "Here's your items I've been storing for you.",
	postCallback = function(self, client, target)
		if SERVER then
			local character = client:GetCharacter()			
			local ID = character:GetData("bankID")
			local bank

			if ID then
				local bankstruct = {}
				bankstruct[ID] = {character:GetData("bankW", ix.config.Get("bankW", 3)), character:GetData("bankH", ix.config.Get("bankH", 2))}
				ix.inventory.Restore(bankstruct, ix.config.Get("bankW", 3), ix.config.Get("bankH", 2), function(inventory)
					bank = inventory
					bank:SetOwner(character:GetID())
				end)
			else
				bank = ix.inventory.Create(ix.config.Get("bankW", 3), ix.config.Get("bankH", 2), os.time())
				bank:SetOwner(character:GetID())
				bank:Sync(client)
		
				character:SetData("bankID", bank:GetID())
			end

			timer.Simple(0.1, function()
				ix.storage.Open(client, bank, {
					entity = client,
					name = "Personal Storage",
					searchText = "Accessing personal storage...",
					searchTime = ix.config.Get("containerOpenTime", 1)
				})
			end)
		end
	end,
	options = {
		"BackTopic"
	}
})

DIALOGUE.addTopic("ConfirmStorageUpgrade", {
	statement = "",
	response = "",
	IsDynamicFollowup = true,
	IsDynamic = true,
	DynamicPreCallback = function(self, player, target, dyndata)
		if(dyndata) then
			if (CLIENT) then
				self.response = string.format("Upgrading your stash %s will cost you %s.", dyndata.direction, ix.currency.Get(dyndata.cost))
			else
				target.upgradestruct = { dyndata.direction, dyndata.cost }
			end
		end
	end,
	GetDynamicOptions = function(self, client, target)

		local dynopts = {
			{statement = "Expensive, but alright. Upgrade my stash.", topicID = "ConfirmStorageUpgrade", dyndata = {accepted = true}},
			{statement = "Eh, what's with that price? No thanks.", topicID = "ConfirmStorageUpgrade", dyndata = {accepted = false}},
		}

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		if( SERVER and dyndata.accepted ) then

			local bankH = client:GetCharacter():GetData("bankH", ix.config.Get("bankH", 2))
			local bankW = client:GetCharacter():GetData("bankW", ix.config.Get("bankW", 3))

			if target.upgradestruct[1] == "vertically" then
				if bankH < ix.config.Get("bankHMax", 2) then
					client:GetCharacter():SetData("bankH", bankH+1)
					client:Notify("Updated your storage to height: "..client:GetCharacter():GetData("bankH"))
					client:GetCharacter():TakeMoney(target.upgradestruct[2])
					ix.dialogue.notifyMoneyLost(client, target.upgradestruct[2])


				else
					client:Notify("Cannot update storage! It's height maxed, which is "..client:GetCharacter():GetData("bankH", ix.config.Get("bankH", 2)))
				end
			elseif target.upgradestruct[1] == "horizontally" then
				if bankW < ix.config.Get("bankWMax", 2) then
					client:GetCharacter():SetData("bankW", bankW+1)
					client:Notify("Updated your storage to width: "..client:GetCharacter():GetData("bankW"))
					client:GetCharacter():TakeMoney(target.upgradestruct[2])
					ix.dialogue.notifyMoneyLost(client, target.upgradestruct[2])
				else
					client:Notify("Cannot update storage! It's width is maxed, which is "..client:GetCharacter():GetData("bankW", ix.config.Get("bankW", 3)))
				end
			end
		end
		if(SERVER)then
			target.upgradestruct = nil
		end
		-- Return the next topicID
		return "BackTopic"
	end,
})

DIALOGUE.addTopic("NotEnoughMoneyStorage", {
	statement = "",
	response = "You lack the funds to upgrade your stash. Return to me once you get more funds.",
	options = {
		"BackTopic"
	}
})

DIALOGUE.addTopic("BackgroundTopic", {
	statement = "Tell me about yourself.",
	response = "Not a whole lot to know. I came here a few months ago, after the military presence ramped up their presence around here - turns out the swamps are the only place they haven't really cut off around the perimeter of the zone, which means that this is where we stay for now. I worked as a trader back in the days, so thought I might as well put my skills to use here too. Oh, and I have a bunch of friends who can get things. And remove things, like you, if you keep asking.",
	options = {
		"BackTopic",
	}
})

DIALOGUE.addTopic("InterestTopic", {
	statement = "Can you tell me something interesting?",
	response = "Sure. How about you do business with me, or shut the fuck up?",
	options = {
		"BackTopic",
	}
})

DIALOGUE.addTopic("AboutWorkTopic", {
	statement = "About work...",
	response = "",
	IsDynamic = true,
	options = {
		"BackTopic"
	},
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}

		if(client:ixHasJobFromNPC(target:GetDisplayName())) then
			local jobs = client:GetCharacter():GetJobs()

			-- If it's an item delivery quest
			local itemuid = ix.jobs.isItemJob(jobs[target:GetDisplayName()].identifier)

			if itemuid and not jobs[target:GetDisplayName()].isCompleted then
				dynopts = {
					{statement = string.format("Hand over 1 %s", ix.item.list[itemuid].name), topicID = "AboutWorkTopic", dyndata = {identifier = itemuid}},
				}
			end
		end

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	preCallback = function(self, client, target)
		if client:ixHasJobFromNPC(target:GetDisplayName()) then
			local jobs = client:GetCharacter():GetJobs()
			if (jobs[target:GetDisplayName()].isCompleted) then
				if (SERVER) then 
					ix.dialogue.notifyTaskComplete(client, ix.jobs.getFormattedName(jobs[target:GetDisplayName()]))
					client:ixJobComplete(target:GetDisplayName()) 
				end
				if (CLIENT) then self.response = "Great work on the job, here's your reward." end
			else
				if (CLIENT) then self.response = string.format("Have you finished %s yet?", ix.jobs.getFormattedName(jobs[target:GetDisplayName()])) end
			end
		else
			if (CLIENT) then self.response = "You're not working for me right now." end
		end

	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		netstream.Start("job_deliveritem", target:GetDisplayName())

		-- Return the next topicID
		return "BackTopic"
	end,
	ShouldAdd = function()
		if (LocalPlayer():GetCharacter():GetJobs()["'Cleaner'"]) then
			return true
		end
	end
})

DIALOGUE.addTopic("ConfirmTask", {
	statement = "",
	response = "",
	IsDynamicFollowup = true,
	IsDynamic = true,
	DynamicPreCallback = function(self, player, target, dyndata)
		if(dyndata) then
			if (CLIENT) then
				self.response = dyndata.description
			else
				target.taskid = dyndata.identifier
			end
		end
	end,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {
			{statement = "I'll take it", topicID = "ConfirmTask", dyndata = {accepted = true}},
			{statement = "I'll pass", topicID = "ConfirmTask", dyndata = {accepted = false}},
		}
		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		if (SERVER) then
			if (dyndata.accepted) then
				if (!ix.jobs.NPCHasJob(target:GetDisplayName(), target.taskid)) then
					client:Notify("Task was taken by somebody else!")
				else
					ix.dialogue.notifyTaskGet(client, ix.jobs.getFormattedNameInactive(target.taskid))
		
					client:ixJobAdd(target.taskid, target:GetDisplayName())
		
					ix.jobs.setNPCJobTaken(target:GetDisplayName(), target.taskid)
				end
			end
			
			target.taskid = nil
		end
		
		-- Return the next topicID
		return "BackTopic"
	end,
})

DIALOGUE.addTopic("GetTask", {
	statement = "Do you have any work for me?",
	response = "Yes, have a look.",
	options = {
		"BackTopic"
	},
	preCallback = function(self, client, target)
		if client:ixHasJobFromNPC(target:GetDisplayName()) and CLIENT then
			self.response = "I already gave you some work."
		end
	end,
	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}

		if not client:ixHasJobFromNPC(target:GetDisplayName()) then
			local jobs = target:GetNetVar("jobs")

			for k,v in pairs(jobs) do
				table.insert(dynopts, {statement = ix.jobs.getFormattedNameInactive(v), topicID = "GetTask", dyndata = {identifier = v}})
			end
		end
		
		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)

		-- Return the next topicID
		return "ConfirmTask", {description = ix.jobs.getFormattedDescInactive(dyndata.identifier), identifier = dyndata.identifier}
	end,
	ShouldAdd = function()
		if (!LocalPlayer():GetCharacter():GetJobs()["'Cleaner'"]) then
			return true
		end
	end
})

DIALOGUE.addTopic("GetTaskByDifficulty", {
	statement = "Do you have any work for me?",
	response = "Yes, what difficulty task are you looking for?.",
	options = {
		"BackTopic"
	},
	preCallback = function(self, client, target)
		if client:ixHasJobFromNPC(target:GetDisplayName()) and CLIENT then
			self.response = "I already gave you some work."
		end
	end,
	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}
		
		if not client:ixHasJobFromNPC(target:GetDisplayName()) then
			table.insert(dynopts, {statement = "A trivial task.", topicID = "GetTaskByDifficulty", dyndata = {difficulty = "easy"}})
			table.insert(dynopts, {statement = "A challenging task.", topicID = "GetTaskByDifficulty", dyndata = {difficulty = "medium"}})
			table.insert(dynopts, {statement = "A hard task.", topicID = "GetTaskByDifficulty", dyndata = {difficulty = "hard"}})
		end
		
		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		if (SERVER) then
			local possibleJobs = target:GetNetVar("possibleJobs")
			local jobCategories = table.Random(possibleJobs[dyndata.difficulty])
			local jobid = ix.jobs.getJobFromCategory(jobCategories)

			if !client:ixJobAdd(jobid, target:GetDisplayName()) then
				return "BackTopic", dynopts
			end
			ix.dialogue.notifyTaskGet(client, ix.jobs.getFormattedNameInactive(jobid))
			ix.jobs.setNPCJobTaken(target:GetDisplayName(), jobid)
		end		

		-- Return the next topicID
		return "BackTopic", dynopts
	end,
	ShouldAdd = function()
		if (!LocalPlayer():GetCharacter():GetJobs()["'Cleaner'"]) then
			return true
		end
	end,
})


----------------------------------------------------------------
--------------------START-SUITCHANGE-START----------------------
----------------------------------------------------------------

DIALOGUE.addTopic("ChangeSuitVariant", {
	statement = "Can you exchange my suit to another variant?",
	response = "Which suit would you like to exchange?",
	IsDynamic = true,
	options = {
		"BackTopic"
	},
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}
		local items = client:GetCharacter():GetInventory():GetItems()

		for k,v in pairs(items) do
			if v.baseSuit and !v:GetData("equip") then
				local convertcost = math.Round(v.price / 10)
				table.insert(dynopts, {statement = v:GetName().." - "..ix.currency.Get(convertcost), topicID = "ChangeSuitVariant", dyndata = {itemuid = v.uniqueID, itemid = v:GetID(), cost = convertcost, baseSuit = v.baseSuit}})
			end
		end
		
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)

		-- Return the next topicID
		if( !client:GetCharacter():HasMoney(dyndata.cost)) then
			return "NotEnoughMoneySuitVariantChange"
		end
		return "ChangeSuitVariantP2", dyndata
	end,
})

DIALOGUE.addTopic("ChangeSuitVariantP2", {
	statement = "",
	response = "",
	IsDynamicFollowup = true,
	IsDynamic = true,
	DynamicPreCallback = function(self, player, target, dyndata)
		if(dyndata) then
			if (CLIENT) then
				self.response = string.format("Which suit would you like instead? It will cost you %s. Be sure to remove attachments beforehand.", ix.currency.Get(dyndata.cost))
			end

			target.selectedsuitstruct = { dyndata.itemid, dyndata.itemuid, dyndata.cost, dyndata.baseSuit }
		end
	end,
	GetDynamicOptions = function(self, client, target)

		local suitVariants = {}
		for _, v in pairs(ix.item.list) do
			if target.selectedsuitstruct[4] == v.baseSuit then
				table.insert(suitVariants, {uniqueID = v.uniqueID, name = v.name})
			end
		end

		local dynopts = {}
		for _, v in pairs(suitVariants) do
			if v.uniqueID == target.selectedsuitstruct[2] then
				continue
			end

			table.insert(dynopts, {statement = v.name.." with cost "..ix.currency.Get(target.selectedsuitstruct[3]), topicID = "ChangeSuitVariantP2", dyndata = {suitVariantUID = v.uniqueID, accepted = true}})
		end

		table.insert(dynopts, {statement = "Actually, nevermind...", topicID = "ChangeSuitVariantP2", dyndata = {accepted = false}})

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)
		if( SERVER and dyndata.accepted ) then
			ix.dialogue.notifyMoneyLost(client, ix.currency.Get(target.selectedsuitstruct[3]))
			client:GetCharacter():TakeMoney(target.selectedsuitstruct[3])

			ix.item.instances[target.selectedsuitstruct[1]]:Remove()
			client:GetCharacter():GetInventory():Add(dyndata.suitVariantUID)
		end
		-- Return the next topicID
		return "BackTopic"
	end,
})

DIALOGUE.addTopic("NotEnoughMoneySuitVariantChange", {
	statement = "",
	response = "Not enough money for that.",
	options = {
		"BackTopic"
	}
})

----------------------------------------------------------------
----------------------END-SUITCHANGE-END------------------------
----------------------------------------------------------------


DIALOGUE.addTopic("HandInComplexProgressionItemTopic", {
	statement = "",
	response = "",
	IsDynamicFollowup = true,
	options = {
		"BackTopic"
	},
	DynamicPreCallback = function(self, player, target, dyndata)
		if (dyndata) then
			if(CLIENT)then
				self.response = string.format("Great, the %s fits nicely in my pocket.", ix.item.list[dyndata.itemid].name)
			else
				if ix.progression.IsActive(dyndata.progid) then
					
					local item = player:GetCharacter():GetInventory():HasItem(dyndata.itemid)

					local dat = ix.progression.status[dyndata.progid].complexData
					dat = dat or {}
					local amtcur = dat[dyndata.itemid] or 0

					local reqitems = ix.progression.GetComplexProgressionReqs(dyndata.progid)
					local amtreq = reqitems[dyndata.itemid]

					local amtneed = amtreq - amtcur

					if(item)then
						local amtavailable = item:GetData("quantity", item.quantity or 1)
						local amtfinal = amtavailable >= amtneed and amtneed or amtavailable

						--Adds reward
						repReward, monReward = ix.util.GetValueFromProgressionTurnin(item, amtfinal)
						player:addReputation(repReward)
						ix.dialogue.notifyReputationReceive(player, repReward)
						player:GetCharacter():GiveMoney(monReward)
						ix.dialogue.notifyMoneyReceive(player, monReward)
						
						item:SetData("quantity", item:GetData("quantity",0) - amtfinal)
						
						if(item:GetData("quantity", 0) < 1)then
							item:Remove()
						end

						ix.progression.AddComplexProgressionValue(dyndata.progid, {dyndata.itemid, amtfinal}, player:Name())
					end
				end
			end	
		end
	end,
} )

DIALOGUE.addTopic("ViewProgression", {
	statement = "",
	response = "",
	options = {
		"BackTopic"
	},

	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}

		--disgusting
		--local identifier = player:GetCharacter():GetData("curdialogprog")
		local identifier 	= self.tmp
		self.tmp = nil
		local progstatus 	= ix.progression.GetComplexProgressionValue(identifier)
		local progdef 		= ix.progression.definitions[identifier]
		if(progdef.fnAddComplexProgression)then
			local progitems 	= progdef.GetItemIds()
			local missingitems  = {}

			for progitem,cnt in pairs(progitems) do
				local curcnt = 0
				if(progstatus and progstatus[progitem]) then curcnt = progstatus[progitem] end

				if(curcnt < cnt and client:GetCharacter():GetInventory():HasItem(progitem))then
					table.insert(missingitems, progitem)
				end
			end

			for _, progitem in pairs(missingitems) do
				table.insert(dynopts, {statement = "Hand over "..ix.item.list[progitem].name, topicID = "ViewProgression", dyndata = {progid = identifier, itemid = progitem}})
			end
		end

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)

		-- Return the next topicID
		return "HandInComplexProgressionItemTopic", dyndata
	end,

	IsDynamicFollowup = true,
	DynamicPreCallback = function(self, player, target, dyndata)
		if (dyndata) then
			if(CLIENT)then
				local progstatus 	= ix.progression.status[dyndata.identifier]
				local progdef 		= ix.progression.definitions[dyndata.identifier]

				self.response = progdef.BuildResponse(progdef, progstatus)
				self.tmp = dyndata.identifier
			end
		end
	end,
})
DIALOGUE.addTopic("AboutProgression", {
	statement = "Do you need help with anything?",
	response = "I have a few things I need done.",
	options = {
		"BackTopic"
	},
	preCallback = function(self, client, target)
		if( CLIENT ) then
			if #ix.progression.GetActiveProgressions("'Cleaner'") <= 0 then
				self.response = "Nothing at the moment."
			end

			net.Start("progression_sync")
			net.SendToServer()
		end
	end,
	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}

		for _, progid in pairs(ix.progression.GetActiveProgressions("'Cleaner'")) do
			table.insert(dynopts, {statement = ix.progression.definitions[progid].name, topicID = "AboutProgression", dyndata = {identifier = progid}})
		end

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)

		-- Return the next topicID
		return "ViewProgression", dyndata
	end,
})


DIALOGUE.addTopic("StartBarter", {
	statement = "Exchange?",
	response = "Sure.",
	options = {
		"BackTopic"
	},
	preCallback = function(self, client, target)
		if( CLIENT ) then
			local barters = ix.npcbarter.GetActiveBartersForNPC("'Cleaner'")

			if #barters <= 0 then
				self.response = "Nothing at the moment."

				net.Start("npcbarter_sync")
				net.SendToServer()
			else
				self.response = "I have the following things up for barter:"

				for _, barter in pairs(barters) do
					self.response = self.response.."\n    "..ix.npcbarter.barterdict["'Cleaner'"][barter].description
				end
			end

		end
	end,
	IsDynamic = true,
	GetDynamicOptions = function(self, client, target)
		local dynopts = {}

		for _, barterid in pairs(ix.npcbarter.GetActiveBartersForNPC("'Cleaner'")) do
			local barterstruct = ix.npcbarter.barterdict["'Cleaner'"][barterid]

			local barterItem = barterstruct.barterItem
			local barterCnt = barterItem[2] or 1

			for _, reqitem in pairs(barterstruct.reqItem) do
				local reqItemCnt = reqitem[2] or 1

				table.insert(dynopts, {statement = reqItemCnt.."x "..ix.item.list[reqitem[1]].name.." to "..barterCnt.."x "..ix.item.list[barterItem[1]].name, topicID = "StartBarter", dyndata = {npcname = "'Cleaner'", identifier = barterid, reqitem = reqitem[1]}})
			end
		end

		-- Return table of options
		-- statement : String shown to player
		-- topicID : should be identical to addTopic id
		-- dyndata : arbitrary table that will be passed to ResolveDynamicOption
		return dynopts
	end,
	ResolveDynamicOption = function(self, client, target, dyndata)

		if CLIENT then
			ix.npcbarter.TryExecuteBarter(dyndata.npcname, dyndata.identifier, dyndata.reqitem)
		end

		-- Return the next topicID
		return "BackTopic", dyndata
	end,
})


DIALOGUE.addTopic("BackTopic", {
	statement = "Let's talk about something else...",
	response = "All right.",
	options = {
		"TradeTopic",
		"StorageTopic",
		"BackgroundTopic",
		"InterestTopic",
		"AboutWorkTopic",
		-- "GetTask",
		"GetTaskByDifficulty",
		"AboutProgression",
		"StartBarter",
		"ChangeSuitVariant",
		"GOODBYE"
	},
	preCallback = function(self, client, target)		

	end
})



DIALOGUE.addTopic("GOODBYE", {
	statement = "See you around.",
	response = "Come back soon, STALKER..."
})

