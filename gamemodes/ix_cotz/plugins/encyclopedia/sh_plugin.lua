if (CLIENT) then
    function PLUGIN:PlayerButtonDown(client, key)
        -- Quick help menu
        if (key == KEY_F1) then
            if (client:GetCharacter() and not hook.Run("ShouldSuppressMenu", client) and not IsValid(ix.gui.menu)) then
                local quickhelp = vgui.Create("ixMenu")
                quickhelp.tabs.buttons[4]:SetSelected(true)
            end
        end
    end
end

function PLUGIN:PopulateHelpMenu(tabs)
    tabs["readme"] = function(container)
        local title = container:Add("DLabel")
        title:SetText("Welcome to Call of the Zone!")
        title:SetFont("stalkerregularbigfont")
        title:Dock(TOP)
        title:InvalidateLayout(true)
        title:SetAutoStretchVertical(true)
        local wip = container:Add("DLabel")
        wip:SetFont("stalkerregularsmallfont")
        wip:SetText("The server is in development, everything you see is work in progress!")
        wip:Dock(TOP)
        wip:SetAutoStretchVertical(true)
        local lore = container:Add("DLabel")
        lore:SetWrap(true)
        lore:SetFont("stalkerregularfont")
        lore:SetText("Call of the Zone is a gamemode where you are required to cooperate to survive the zone. Death is punishing, rewards are small, and you need to stick together and cooperate if you plan to get anywhere. The gamemode is a proof of concept for what we would like to think as a stalker multiplayer gamemode, and draws inspiration from many games and GMOD gamemodes. Atmosphere has it's highest focus, and the gameplay is supposed to be as optimized and smooth as possible.")
        lore:Dock(TOP)
        lore:DockMargin(0, 16, 0, 0)
        lore:SetAutoStretchVertical(true)
        local lore2 = container:Add("DLabel")
        lore2:SetFont("stalkerregularfont")
        lore2:SetText("You'll be moving forward as a playerbase as you do tasks for various NPC's to progress, and gain access to new NPC's, tasks and items. Hence, again, cooperation is heavily encouraged! Eventually you'll be able to unlock new zones for you to travel to.")
        lore2:Dock(TOP)
        lore2:DockMargin(0, 16, 0, 0)
        lore2:SetWrap(true)
        lore2:SetAutoStretchVertical(true)
        local lore3 = container:Add("DLabel")
        lore3:SetFont("stalkerregularfont")
        lore3:SetText("Lastly, we encourage you to explore and find out how many things work yourselves and share them with the community. We do on try to keep radio silence with most things as developers, and leave it up to you to uncover the secrets of the zone.")
        lore3:Dock(TOP)
        lore3:DockMargin(0, 16, 0, 0)
        lore3:SetWrap(true)
        lore3:SetAutoStretchVertical(true)
        local keys = container:Add("DLabel")
        keys:SetFont("stalkerregularfont")
        keys:SetText("Don't die, as death resembles ironman mode without deleting your character. Good luck, stalkers, and have fun!")
        keys:Dock(TOP)
        keys:DockMargin(0, 16, 0, 0)
        keys:SetWrap(true)
        keys:SetAutoStretchVertical(true)
    end
end
