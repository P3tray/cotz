PLUGIN.name = "Progression"
PLUGIN.author = "gumlefar"
PLUGIN.desc = "System for tracking serverwide progression and performing actions based on progression levels."

ix.progression = ix.progression or {}
ix.progression.status = ix.progression.status or {}
ix.progression.definitions = ix.progression.definitions or {}

function ix.progression.Register(progid, data)
	ix.progression.definitions[progid] = data
end

ix.util.Include("sh_definitions.lua")

ix.util.Include("sh_technutprog.lua")
ix.util.Include("sh_cleanerprog.lua")
ix.util.Include("sh_hagglerprog.lua")
ix.util.Include("sh_muteprog.lua")
ix.util.Include("sh_oldtimerprog.lua")
ix.util.Include("sh_quarterprog.lua")
ix.util.Include("sh_spicylemonprog.lua")
ix.util.Include("sh_jittersprog.lua")
ix.util.Include("sh_eggheadprog.lua")

function PLUGIN:LoadData()
	ix.progression.status = self:GetData() or {}

	for progid, _ in pairs(ix.progression.definitions) do
		ix.progression.InvokeProgression(progid)
	end
end

function PLUGIN:SaveData()
	self:SetData(ix.progression.status)
end

function PLUGIN:PlayerSpawn(client, transition)
	net.Start("progression_sync_receive")
	net.WriteTable(ix.progression.status)
	net.Send(client)
end

function PLUGIN:PopulateHelpMenu(tabs)
    tabs["progression"] = function(container)
		local title = container:Add("DLabel")
        title:SetText("Overall Progression")
        title:SetFont("stalkerregularbigfont")
        title:Dock(TOP)
        title:InvalidateLayout(true)
        title:SetAutoStretchVertical(true)

		local intro = container:Add("DLabel")
        intro:SetWrap(true)
        intro:SetFont("stalkerregularfont")
        intro:SetText("Below is a list of known NPCs and what they need for various progressions. Might be slightly outdated due to the slow networking conditions of the zone.")
        intro:Dock(TOP)
        intro:DockMargin(0, 16, 0, 0)
        intro:SetAutoStretchVertical(true)

		local npcidentifiers = {}
		local initialNpcs = {
			"'Old Timer'",
			"'Technut'",
			"'Jitters'",
			"'Cleaner'",
			"'Quartermaster'",
			"'Boss'",
			"'Smartass'",
		}

		table.Add(npcidentifiers, initialNpcs)

		if ix.progression.IsCompleted("smartass_rfTasks") then
			local ecologistNpcs = {
				"'Egghead'",
				"'Beanstalk'",
				"'Intern'",
			}
			table.Add(npcidentifiers, ecologistNpcs)
		end

		if ix.progression.IsCompleted("computerDelivery_activateItem") then
			local pripyatNpcs = {
				"'Computer'",
			}
			table.Add(npcidentifiers, pripyatNpcs)
		end

		for _, npcidentifier in pairs(npcidentifiers) do
			local npctitle = container:Add("DLabel")
			npctitle:SetWrap(true)
			npctitle:SetFont("stalkerregularbigfont")
			npctitle:SetText(npcidentifier)
			npctitle:Dock(TOP)
			npctitle:DockMargin(0, 16, 0, 0)
			npctitle:SetAutoStretchVertical(true)

			local activeProgressions = 0
			for k, v in pairs(ix.progression.GetActiveProgressions(npcidentifier)) do
				local progdef = ix.progression.definitions[v]
				local progstatus = ix.progression.GetComplexProgressionValue(v)
				activeProgressions = activeProgressions + 1
	
				local progressiontitle = container:Add("DLabel")
				progressiontitle:SetWrap(true)
				progressiontitle:SetFont("stalkerregularfont")
				progressiontitle:SetText(progdef.name)
				progressiontitle:Dock(TOP)
				progressiontitle:DockMargin(0, 16, 0, 0)
				progressiontitle:SetAutoStretchVertical(true)
	
				if(progdef.fnAddComplexProgression)then
					local progitems 	= progdef.GetItemIds()
					local missingitems  = {}
	
					local progressiondescription = container:Add("DLabel")
					progressiondescription:SetWrap(true)
					progressiondescription:SetFont("stalkerregularsmallfont")
					progressiondescription:SetText(progdef:BuildResponse(progdef.keyNpc, progstatus))
					progressiondescription:Dock(TOP)
					progressiondescription:DockMargin(0, 16, 0, 0)
					progressiondescription:SetAutoStretchVertical(true)
				end
			end

			if activeProgressions == 0 then
				npctitle:Remove()
			end
		end
	end
end