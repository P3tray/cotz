ix.jobs = ix.jobs or {}
ix.jobs.list = ix.jobs.list or {}

ix.jobs.jobsbycategory = ix.jobs.jobsbycategory or {}

--[[
  JOB STRUCT should contain

  name -- Name of the job - string
  icon -- icon to display - Material
  desc -- Description of the job, can contain format characters - string
  tier -- Tier of the job, based on reputation tiers - number
  listenTrigger -- Name of the trigger to listen for - string
  numberRec -- Required number of times the trigger needs to be heard. If table a random number is selected. - number/table
  reward -- Item to give the player upon completion. If this is a table a random item from the table is selected, supports data - string/table
  rewardCount -- How many times we should try to give the player an item. If table a random number is selected. - number/table
  repReward -- How much rep to give a player from quest completion - number/table

  EXAMPLE

  local tempJob = {}

  tempJob.name = "Kill %d mutants."
  tempJob.desc = "Kill %d %s."
  tempJob.tier = 1
  tempJob.listenTrigger = "mutantKilled"
  tempJob.numberRec = {5,10}
  tempJob.reward = {{"makarov", {["durability"] = 15}},{"9x19"}}
  tempJob.rewardCount = {1,3}
  tempJob.repReward = 200

  ix.jobs.register(tempJob)

  ACTIVE JOB STRUCT should contain
  
  identifier
  listenTrigger
  numberRec
  progress
  isCompleted
  
--]]

function ix.jobs.isStructValid(jobstruct)
  if (!jobstruct.name or type(jobstruct.name) != "string") then return false end
  if (!jobstruct.listenTrigger or type(jobstruct.listenTrigger) != "string") then return false end
  if !jobstruct.numberRec then return false end
  if !jobstruct.reward then return false end
  if !jobstruct.icon then jobstruct.icon = Material("path/to/defaulticon.png") end

  return true
end

function ix.jobs.getFormattedName(activejob)
  return string.format(ix.jobs.list[activejob.identifier].name,activejob.numberRec)
end

function ix.jobs.getFormattedDesc(activejob)
  return string.format(ix.jobs.list[activejob.identifier].desc,activejob.numberRec)
end

function ix.jobs.getFormattedNameInactive(identifier)
  local n = 0
  if istable(ix.jobs.list[identifier].numberRec) then
    n = ix.jobs.list[identifier].numberRec[1]
  else
    n = ix.jobs.list[identifier].numberRec
  end
  return string.format(ix.jobs.list[identifier].name,n)
end

function ix.jobs.getFormattedDescInactive(identifier)
  local n = 0
  if istable(ix.jobs.list[identifier].numberRec) then
    n = ix.jobs.list[identifier].numberRec[1]
  else
    n = ix.jobs.list[identifier].numberRec
  end
  return string.format(ix.jobs.list[identifier].desc,n)
end

function ix.jobs.isItemJob(jobname)
  local underscorepos = string.find(jobname, "_")
  if underscorepos then
    return string.sub(jobname, underscorepos + 1)
  else
    return false
  end
end

function ix.jobs.getJobFromTier(tier)
  local v, k = table.Random(ix.jobs.list)
  local n = 0

  while (v.tier != tier or n == 20) do
    v, k = table.Random(ix.jobs.list)
    n = n+1
  end

  return k
end

function ix.jobs.getJobFromCategory(categories)
  if (!istable(categories)) then categories = {categories} end

  local tmp = {}

  for k,v in pairs(categories) do
    if(ix.jobs.jobsbycategory[v]) then
      table.Add(tmp, ix.jobs.jobsbycategory[v])
    end
  end

  table.Add(tmp, ix.jobs.jobsbycategory["miscjobs"] or {})

  return tmp[ math.random( #tmp ) ]
end

local playerMeta = FindMetaTable("Player")
function playerMeta:ixHasJobFromNPC(npcidentifier)
  curJobs = self:GetCharacter():GetJobs()

  if curJobs[npcidentifier] then
    return true
  else 
    return false
  end
end

hook.Add("ix_JobTrigger", "JobProgress", function(client, triggerstring)
  client:ixJobEvaluate(triggerstring)
end)

if SERVER then
  local playerMeta = FindMetaTable("Player")

  function playerMeta:ixJobEvaluate(trigger)
    --print("Evaluating quest with ID: "..trigger)

    --Check if player has quest
    local curJobs = self:GetCharacter():GetJobs()
    for k,v in pairs(curJobs) do
      if v.listenTrigger == trigger then

        --Progress quest for player OR mark as completed
        local curProgress = curJobs[k].progress
        local curMax = curJobs[k].numberRec

        if (curProgress < curMax and !curJobs[k].isCompleted) then
          curJobs[k].progress = curJobs[k].progress + 1
          if curProgress+1 == curMax then
            curJobs[k].isCompleted = true
          end
        else
          curJobs[k].isCompleted = true
        end
      end
    end

    self:GetCharacter():SetJobs(curJobs)
  end

  function playerMeta:ixJobComplete(npcidentifier)
    --print("Completing quest with ID: "..npcidentifier)

    if self:ixHasJobFromNPC(npcidentifier) then
      local curJobs = self:GetCharacter():GetJobs()
      --Check if job is marked as complete
      if curJobs[npcidentifier].isCompleted then
        --Check rewards & rewardcount
        local identifier = curJobs[npcidentifier].identifier

        local rewCount = 0
        if type(ix.jobs.list[identifier].rewardCount) == "table" then
          rewCount = math.random(ix.jobs.list[identifier].rewardCount[1],ix.jobs.list[identifier].rewardCount[2])
        else 
          rewCount = ix.jobs.list[identifier].rewardCount
        end

        for i = 1, rewCount do
          local reward
          if type(ix.jobs.list[identifier].reward) == "table" then
            reward = table.Random(ix.jobs.list[identifier].reward)
          else 
            reward = ix.jobs.list[identifier].reward
          end

          --Give player items
          if (self:GetCharacter() and !self:GetCharacter():GetInventory():Add(reward[1], 1, reward[2] or {})) then
            ix.item.Spawn(reward[1], self:GetItemDropPos(), nil, AngleRand(), reward[2] or {})
          end

          ix.dialogue.notifyItemGet(self, ix.item.list[reward[1]].name)
        end

        self:addReputation(ix.jobs.list[identifier].repReward)

        --Remove job from player
        curJobs[npcidentifier] = nil

        self:GetCharacter():SetJobs(curJobs)

      end
    end
  end

  function playerMeta:ixJobAdd(identifier, npcidentifier)
    --print("Adding quest with ID: "..identifier)
    curJobs = self:GetCharacter():GetJobs()

    --Check if player already has a job from this npc
    if curJobs[npcidentifier] then return false end
    --Evaluate job parameters | numberRec, listenTrigger, progress=0, isCompleted=false |
    temp = {}

    temp.identifier = identifier

    if type(ix.jobs.list[identifier].numberRec) == "table" then
      temp.numberRec = math.random(ix.jobs.list[identifier].numberRec[1],ix.jobs.list[identifier].numberRec[2])
    else
      temp.numberRec = ix.jobs.list[identifier].numberRec
    end

    temp.listenTrigger = ix.jobs.list[identifier].listenTrigger

    temp.progress = 0

    temp.isCompleted = false

    curJobs[npcidentifier] = temp

    self:GetCharacter():SetJobs(curJobs)
  end

end