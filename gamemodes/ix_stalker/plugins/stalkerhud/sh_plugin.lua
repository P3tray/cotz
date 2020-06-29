local PLUGIN = PLUGIN
PLUGIN.name = "STALKER Hud"
PLUGIN.author = "Verne"
PLUGIN.desc = "A hud in the stalker theme"

ix.util.Include("cl_plugin.lua")

function PLUGIN:CanDrawAmmoHUD()
	return false
end

function PLUGIN:ShouldHideBars()
	return true
end

if ix.bar then
	--ix.bar.Remove("health")
	--ix.bar.Remove("armor")
	--ix.bar.Remove("stm")

	function ix.bar.DrawAction()
		local start, finish = ix.bar.actionStart, ix.bar.actionEnd
		local curTime = CurTime()
		local scrW, scrH = ScrW(), ScrH()
		

		if (finish > curTime) then
			local x, y = scrW*0.05, scrH*0.04

			draw.SimpleText(ix.bar.actionText, "stalkerregulartitlefont", x, y, TEXT_COLOR)
			draw.SimpleText(math.Round(finish - curTime, 1), "stalkerregulartitlefont", x, y + ScrH() * 0.03, TEXT_COLOR)
		end
	end
end

ix.option.Add("cursor", ix.type.bool, true, {
	category = "appearance",
})

ix.option.Add("gasmaskoverlay", ix.type.bool, true, {
	category = "appearance",
})

ix.command.Add("invtest", {
	OnRun = function(self, client)
		netstream.Start(client, "invtest")
	end
})

if (CLIENT) then
	netstream.Hook("invtest", function(self, client)
		local frame = vgui.Create("ixStalkerInventoryPanel")
		frame:SetPos(200, 50)
		--frame:SetSize(500, 500)
		frame:MakePopup()
	end)
end