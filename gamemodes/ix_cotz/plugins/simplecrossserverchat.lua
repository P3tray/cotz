
local PLUGIN = PLUGIN

PLUGIN.name = "Simple Cross Server Chat"
PLUGIN.author = "gumlefar"
PLUGIN.description = "A simple system for sharing chat messages over multiple servers."



PLUGIN.lastSeenId = PLUGIN.lastSeenId or 0
PLUGIN.checktime = PLUGIN.checktime or 0
PLUGIN.postTime = PLUGIN.postTime or 0

ix = ix or {}
ix.crossserverchat = ix.crossserverchat or {}
ix.crossserverchat.queue = ix.crossserverchat.queue or {}


if (SERVER) then
	function PLUGIN:Think()
		if self.checktime < CurTime() then 
			self.checktime = CurTime() + 2

			self:CheckForNewData()
		end

		if self.postTime < CurTime() then 
			self.postTime = CurTime() + 1

			self:ProcessTopOfQueue()
		end
	end

	-- Ensures tables exist
	function PLUGIN:LoadTables()
		query = mysql:Create("ix_xserverchat")
		query:Create("id", "INT(11) UNSIGNED NOT NULL AUTO_INCREMENT")
		query:Create("name", "VARCHAR(60)")
		query:Create("text", "TEXT")
		query:Create("sourcemap", "VARCHAR(60)")

		query:PrimaryKey("id")
		query:Execute()
	end

	function PLUGIN:CheckForNewData()
		local query = mysql:Select("ix_xserverchat")
		query:Select("id")
		query:Select("name")
		query:Select("text")
		query:WhereGT("id", self.lastSeenId)
		query:WhereNotEqual("sourcemap", game.GetMap())

		query:Callback(function(result)
			if (istable(result) and #result > 0) then
				for _, v in pairs(result) do
					if (istable(v)) then
						local id = tonumber(v.id)
						local name = v.name or "Unknown"
						local text = v.text or "<corrupted message>"

						if (id > ix.plugin.list["simplecrossserverdata"].lastSeenId) then
							ix.plugin.list["simplecrossserverdata"].lastSeenId = id
						end

						table.insert(ix.crossserverchat.queue, {name, text})
					end
				end
			end
		end)
		query:Execute()
	end


	function PLUGIN:ProcessTopOfQueue()
		if(#ix.crossserverchat.queue > 0)then
			local msg = ix.crossserverchat.queue[1]
			table.remove(ix.crossserverchat.queue, 1)

			ix.chat.Send(nil, "npcpdainternal", "", nil, nil, {
				name = msg[1],
				message = msg[2]
			})
		end
	end

	function PLUGIN:PostMessage(name, text)

		local datatoinsert = {}
		if(not istable(data))then
			data = {data}
		end
		datatoinsert = data

		-- Insert query
		local query = mysql:InsertIgnore("ix_xserverchat")
			query:Insert("name", name)
			query:Insert("text", text)
			query:Insert("sourcemap", game.GetMap())
		query:Execute()
		
	end

	function PLUGIN:SaveData()
		self:SetData({["lastseen"] = self.lastSeenId})
	end

	function PLUGIN:LoadData()
		local data = self:GetData()

		self.lastSeenId = data["lastseen"] or 0
		if(SERVER)then
			self:LoadTables()
		end
	end
end


