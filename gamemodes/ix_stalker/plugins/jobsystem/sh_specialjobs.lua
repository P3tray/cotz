--[[
  --TestJob
  local tempJob = {}

  tempJob.name = "Say sneed %d times."                  --Name that will be shown in dialogue when selecting tasks
  tempJob.desc = "I need you to sneed %d times for me." --Description of task, will be shown to the player when deciding to take quest or not
  tempJob.icon = "propic/event/loot"          --Icon, unused?
  tempJob.tier = 1                                      --Tier, unused?
  tempJob.listenTrigger = "chatSayTest"                 --trigger word to listen for in the ix_JobTrigger hook, see sh_listeners
  tempJob.numberRec = 5                                 --integer amount of times the listenTrigger must be run through the ix_JobTrigger hook
  tempJob.reward = {{"tokarev"}}                     --table of item ids for rewarding the player with
  tempJob.rewardCount = 1                               --how many items should the player get
  tempJob.repReward = 80                                --how much reputation should be awarded for completion
  tempJob.categories = {"mutantkilleasy"}               --table of category identifiers, used for when npc gets tasks
  tempJob.OnTaskGet = function(client)                  --function to run when task is given
  tempJob.OnTaskComplete = function(client)             --function to run when task is handed in
  tempJob.moneyReward = {2000,4000} OR 3000             --for adding money to the player, can technically be done through itemreward as well

  ix.jobs.register(tempJob, "TestJob")                  --If item delivery quest, the final part of the quest identifier should read "_<uniqueid>" for proper operation

]]--



do

  --Scan 2 areas
  local tempJob = {}

  tempJob.name = "Scan 2 areas."
  tempJob.desc = "2 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 1
  tempJob.listenTrigger = "scanAreaEasyComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_ammo_med"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 35
  tempJob.moneyReward = { 4000, 6000 }
  tempJob.categories = {"scanareaeasy"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 2, ["finishedtrigger"] = "scanAreaEasyComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 2) and (v:GetData("finishedtrigger", "error") == "scanAreaEasyComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaEasy1")

  tempJob = nil

  --Scan 2 areas
  local tempJob = {}

  tempJob.name = "Scan 2 areas."
  tempJob.desc = "2 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 1
  tempJob.listenTrigger = "scanAreaEasyComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_ammo_m_low"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 35
  tempJob.moneyReward = { 4000, 6000 }
  tempJob.categories = {"scanareaeasy"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 2, ["finishedtrigger"] = "scanAreaEasyComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 2) and (v:GetData("finishedtrigger", "error") == "scanAreaEasyComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaEasy2")

  tempJob = nil

  --Scan 4 areas
  local tempJob = {}

  tempJob.name = "Scan 4 areas."
  tempJob.desc = "4 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 2
  tempJob.listenTrigger = "scanAreaMedComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_ammo_rare"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 50
  tempJob.moneyReward = { 7000, 9000 }
  tempJob.categories = {"scanareamed"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 4, ["finishedtrigger"] = "scanAreaMedComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 4) and (v:GetData("finishedtrigger", "error") == "scanAreaMedComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaMed1")

  tempJob = nil

  --Scan 4 areas
  local tempJob = {}

  tempJob.name = "Scan 4 areas."
  tempJob.desc = "4 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 2
  tempJob.listenTrigger = "scanAreaMedComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_aid_high"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 50
  tempJob.moneyReward = { 7000, 9000 }
  tempJob.categories = {"scanareamed"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 4, ["finishedtrigger"] = "scanAreaMedComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 4) and (v:GetData("finishedtrigger", "error") == "scanAreaMedComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaMed2")

  tempJob = nil

  --Scan 6 areas
  local tempJob = {}

  tempJob.name = "Scan 6 areas."
  tempJob.desc = "6 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 3
  tempJob.listenTrigger = "scanAreaHighComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_mixed_high"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 75
  tempJob.moneyReward = { 10000, 15000 }
  tempJob.categories = {"scanareahigh"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 6, ["finishedtrigger"] = "scanAreaHighComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 6) and (v:GetData("finishedtrigger", "error") == "scanAreaHighComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaHigh1")

  tempJob = nil

  --Scan 6 areas
  local tempJob = {}

  tempJob.name = "Scan 6 areas."
  tempJob.desc = "6 areas."
  tempJob.icon = "propic/event/area"
  tempJob.tier = 3
  tempJob.listenTrigger = "scanAreaHighComplete"
  tempJob.numberRec = 1
  tempJob.reward = {{"kit_ammo_m_rare"}}
  tempJob.rewardCount = 1
  tempJob.repReward = 75
  tempJob.moneyReward = { 10000, 15000 }
  tempJob.categories = {"scanareahigh"}
  tempJob.OnTaskGet = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        inv:Add("gasanalyzer", 1, { ["npoints"] = 6, ["finishedtrigger"] = "scanAreaHighComplete"} )
        ix.dialogue.notifyItemGet(client, ix.item.list["gasanalyzer"].name)
      end
    end
  end
  tempJob.OnTaskComplete = function(client) 
    local char = client:GetCharacter()
    if(char)then
      local inv = char:GetInventory()
      if(inv)then
        for k,v in pairs(inv:GetItems()) do
          if v.uniqueID == "gasanalyzer" then
            -- Check that everything matches
            if ((v:GetData("npoints", -1) == 6) and (v:GetData("finishedtrigger", "error") == "scanAreaHighComplete") and v:GetData("finished", false)) then
              v:Remove()
              ix.dialogue.notifyItemLost(client, ix.item.list["gasanalyzer"].name)
              break
            end
          end
        end
      end
    end
  end

  ix.jobs.register(tempJob, "scanAreaHigh2")

  tempJob = nil


end

