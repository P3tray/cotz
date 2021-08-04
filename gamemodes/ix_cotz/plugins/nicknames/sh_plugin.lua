PLUGIN.name = "Nicknames"
PLUGIN.author = "verne"
PLUGIN.description = "Nicknames for characters"

ix.char.RegisterVar("nickname", {
	field = "nickname",
	fieldType = ix.type.string,
	default = nil,
	bNoDisplay = true,
	OnSet = function(character, value)
        local client = character:GetPlayer()

        if (!string.find(client:Name(), "'")) then
            local name = string.Split(client:GetCharacter():GetName(), " ")
            local newName = name[1].." '"..nickname.."' "..name[2]
            
            client:GetCharacter():SetName(newName)
        else
            local name = string.Split(client:GetCharacter():GetName(), " ")
            string.Split(client:GetCharacter():GetName(), " ")
            local newName = name[1].." '"..nickname.."' "..name[3]
            
            client:GetCharacter():SetName(newName)
        end
        
        character.vars.nickname = value
    end
})

ix.command.Add("charnicknameset", {
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.string
	},
	OnRun = function(self, client, target, nickname)
		target:SetNickname(nickname)
	end
})

ix.command.Add("charnicknameremove", {
	adminOnly = true,
	arguments = {
		ix.type.character
	},
	OnRun = function(self, client, target)
		target:SetNickname(nil)
	end
})

