PLUGIN.name = "mapedits"
PLUGIN.author = "verne"
PLUGIN.description = "mapedits for various maps"

function PLUGIN:EntityKeyValue(ent, key, value)
    if game.GetMap() == "rp_salvation_2_haven" then
        -- fixes the elevator button not resetting after being pressed once
        if IsValid(ent) and ent:GetClass() == "func_button" and ent:GetName() == "button_down" then
            ent:SetKeyValue("wait", 5)
        end
    end

    if game.GetMap() == "rp_waystation" then
        -- keeps elevatordoors open, regardless of the underground power switches
        if IsValid(ent) and ent:GetClass() == "func_door" and ent:GetName() == "lift_door" then
            ent:SetKeyValue("spawnpos", 1)
        end

        --removes BTR with missing textures
        if IsValid(ent) and ent:MapCreationID() == 1627 then
            ent:Remove()
        end
    end
end