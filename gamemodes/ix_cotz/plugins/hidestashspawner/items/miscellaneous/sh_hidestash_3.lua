ITEM.name = "Lost Veteran PDA"
ITEM.model = "models/lostsignalproject/items/devices/pda.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.description = "The PDA of a lost stalker. It looks fairly used, and did probably belong to an experienced STALKER."
ITEM.price = 6000
ITEM.flag = "A"
ITEM.CustomSpawngroup = "hidestash_tier_3"
ITEM.moneyinterval = {400, 800}

function ITEM:GetDescription()
    if self:GetData("stashtext", nil) == nil then
        return self.description
    else
        if self:GetData("moneytaken", false) == true then
            return self.description .. "\n\n" .. self:GetData("stashtext", nil)
        else
            return self.description .. "\n\nThe pda has a note written on it. It reads:\n" .. self:GetData("stashtext", nil)
        end
    end
end

ITEM.functions.use = {
	name = "Check for information",
	icon = "icon16/stalker/unlock.png",
	OnRun = function(item)
		local loot = { ix.util.GetRandomItemFromPool(item.CustomSpawngroup or "ix_entbox_drops") }
		local spawnpoint = ix.plugin.list["hidestashspawner"]:GetPoint()
		local stashcontent = "CONTENT: "

		if !spawnpoint then
			item.player:Notify("No hidestash spawn points defined for this map, contact the developers.")
			print("a hidestash item was used, but there are no points on the map to spawn it in!")
			return false
		end

		ix.plugin.list["hidestash"]:SpawnStash(spawnpoint[1], { loot[1], loot[2] })
		item:SetData("stashcoordinates", spawnpoint[1])
		item:SetData("stashtext", spawnpoint[2])
		item:SetData("map", game.GetMap())
		for i = 1, #loot[1] do
			stashcontent = stashcontent..", "..loot[i][1]
		end

		item.player:Notify( "You found the location of a stash!" )
		ix.log.Add(item.player, "command", "created a stash from "..item.name.." at x:"..spawnpoint[1].x.." y:"..spawnpoint[1].y.." z:"..spawnpoint[1].z.." with "..stashcontent)

		local money = math.random(item.moneyinterval[1], item.moneyinterval[2])
		item.player:GetCharacter():GiveMoney(money)
		item.player:Notify( "You found "..money.." rubles and wired them to your account!" )
		item:SetData("moneytaken", true)

		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity)) and (item:GetData("stashcoordinates", nil) == nil) and (item:GetData("moneytaken", nil) != true) and item.invID == item.player:GetCharacter():GetInventory():GetID()
	end
}

ITEM.functions.stashpointer = {
	name = "Check stash coordinates",
	icon = "icon16/stalker/throw.png",
	OnRun = function(item)
		if game.GetMap() == item:GetData("map", "gm_construct") then
			item.player:Notify( "You take a close look at the stash coordinates..." )
			netstream.Start(item.player, "nut_DisplayStashSpawnPointsSingle", item:GetData("stashcoordinates", nil))
		else
			item.player:Notify("Stash is not on this map! It's at "..item:GetData("map", "gm_construct"))
		end
		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity)) and (item:GetData("stashcoordinates", nil) != nil) and (item:GetData("moneytaken", nil) != true) and item.invID == item.player:GetCharacter():GetInventory():GetID()
	end
}
