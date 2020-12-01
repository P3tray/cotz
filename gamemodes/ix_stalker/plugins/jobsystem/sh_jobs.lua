--[[
  --TestJob
  local tempJob = {}

  tempJob.name = "Say sneed %d times."                  --Name that will be shown in dialogue when selecting tasks
  tempJob.desc = "I need you to sneed %d times for me." --Description of task, will be shown to the player when deciding to take quest or not
  tempJob.icon = "stalker/questpaper_item.png"          --Icon, unused?
  tempJob.tier = 1                                      --Tier, unused?
  tempJob.listenTrigger = "chatSayTest"                 --trigger word to listen for in the ix_JobTrigger hook, see sh_listeners
  tempJob.numberRec = 5                                 --integer amount of times the listenTrigger must be run through the ix_JobTrigger hook
  tempJob.reward = {{"kit_quest1"}}                     --table of item ids for rewarding the player with
  tempJob.rewardCount = 1                               --how many items should the player get
  tempJob.repReward = 80                                --how much reputation should be awarded for completion
  tempJob.categories = {"mutantkilleasy"}               --table of category identifiers, used for when npc gets tasks

  ix.jobs.register(tempJob, "TestJob")                  --If item delivery quest, the final part of the quest identifier should read "_<uniqueid>" for proper operation

  candidates for adding:
  tempJob.moneyReward = {2000,4000} OR 3000             --for adding money to the player, can technically be done through itemreward as well

]]--



do
  --TestJob
  local tempJob = {}

  tempJob.name = "Say sneed %d times."
  tempJob.desc = "I need you to sneed %d times for me."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "chatSayTest"
  tempJob.numberRec = 5
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 80

  ix.jobs.register(tempJob, "TestJob")

  tempJob = nil


  --item return Job
  local tempJob = {}

  tempJob.name = "%d makarovs."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_makarov"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_makarov")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d lead pipes."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_leadpipe"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_leadpipe")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d crowbars."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_crowbar"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_crowbar")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d bats."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_bat"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_bat")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d fire axes."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_fireaxe"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_fireaxe")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d anomaly maps."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents0"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents0")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d military maps."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents1"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents1")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Anomaly Research Documents (simple)."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents2"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest3"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents2")

  tempJob = nil

  /*local tempJob = {}

  tempJob.name = "%d Beretta 92s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_beretta92"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_beretta92")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Browning Highpowers."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_brhp"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_brhp")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Tokarevs."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_tokarev"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_tokarev")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d CZ-52s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_cz52"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_cz52")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d P99s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_p99"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_p99")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Fort 12s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_fort12"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_fort12")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Glock 17s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_glock17"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_glock17")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Ruger MK3s."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_rugermk3"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_rugermk3")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Black Flashdrives."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_flashdriveblack"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_flashdriveblack")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Blue Flashdrives."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_flashdriveblue"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_flashdriveblue")

  tempJob = nil*/

  local tempJob = {}

  tempJob.name = "%d Personal Belongings."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents4"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents4")

  tempJob = nil

  /*local tempJob = {}

  tempJob.name = "%d Traders Journals."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents8"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents8")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d Ecologists Journals."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_documents8"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_documents9")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d GPS Mapping Devices."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_gpsmappingdevice"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_gpsmappingdevice")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d GPS Tracking Devices."
  tempJob.desc = "xD."
  tempJob.icon = "stalker/questpaper_item.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "itemDeliver_gpstrackingdevice"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "ItemJob_gpstrackingdevice")

  tempJob = nil*/

  --random amount of mutants
  local tempJob = {}

  tempJob.name = "%d mutants."
  tempJob.desc = "%d mutants."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "mutantKilled"
  tempJob.numberRec = {20,30}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killMutantsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d mutants."
  tempJob.desc = "%d mutants."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "mutantKilled"
  tempJob.numberRec = {40,50}
  tempJob.reward = {{"kit_quest3"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killMutantsHigh")

  tempJob = nil

--rodents

  local tempJob = {}

  tempJob.name = "%d rodents."
  tempJob.desc = "%d rodents."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "rodentKilled"
  tempJob.numberRec = {5,10}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killRodentsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d rodents."
  tempJob.desc = "%d rodents."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "rodentKilled"
  tempJob.numberRec = {10,15}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killRodentsHigh")

  tempJob = nil

-- Zombies

  local tempJob = {}

  tempJob.name = "%d zombies."
  tempJob.desc = "%d zombies."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "zombieKilled"
  tempJob.numberRec = {5,10}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killZombiesLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d zombies."
  tempJob.desc = "%d zombies."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "zombieKilled"
  tempJob.numberRec = {10,15}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killZombiesHigh")

  tempJob = nil    

-- Cats

  local tempJob = {}

  tempJob.name = "%d cats."
  tempJob.desc = "%d cats."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "catKilled"
  tempJob.numberRec = {2,3}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killCatsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d cats."
  tempJob.desc = "%d cats."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "catKilled"
  tempJob.numberRec = {4,6}
  tempJob.reward = {{"kit_quest3"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killCatsHigh")

  tempJob = nil

-- bloodsuckers

  local tempJob = {}

  tempJob.name = "%d bloodsuckers."
  tempJob.desc = "%d bloodsuckers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "bloodsuckerKilled"
  tempJob.numberRec = {1,3}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killBloodsuckersLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d bloodsuckers."
  tempJob.desc = "%d bloodsuckers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "bloodsuckerKilled"
  tempJob.numberRec = {3,6}
  tempJob.reward = {{"kit_quest3"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killBloodsuckersHigh")

  tempJob = nil

-- boars

  local tempJob = {}

  tempJob.name = "%d boars."
  tempJob.desc = "%d boars."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "boarKilled"
  tempJob.numberRec = {2,4}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killBoarsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d boars."
  tempJob.desc = "%d boars."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "boarKilled"
  tempJob.numberRec = {4,6}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killBoarsHigh")

  tempJob = nil

-- Burers
  local tempJob = {}

  tempJob.name = "%d burers."
  tempJob.desc = "%d burers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "burerKilled"
  tempJob.numberRec = {1,2}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killBurersLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d burers."
  tempJob.desc = "%d burers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "burerKilled"
  tempJob.numberRec = {2,3}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killBurersHigh")

  tempJob = nil

-- Chimeras
  local tempJob = {}

  tempJob.name = "%d chimeras."
  tempJob.desc = "%d chimeras."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "chimeraKilled"
  tempJob.numberRec = {1,2}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killChimerasLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d chimeras."
  tempJob.desc = "%d chimeras."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 4
  tempJob.listenTrigger = "chimeraKilled"
  tempJob.numberRec = {2,3}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killChimerasHigh")

  tempJob = nil

-- Controllers
/*
  local tempJob = {}

  tempJob.name = "%d controllers."
  tempJob.desc = "%d controllers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "controllerKilled"
  tempJob.numberRec = {1,2}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killControllersLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d controllers."
  tempJob.desc = "%d controllers."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "controllerKilled"
  tempJob.numberRec = {2,4}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killControllersHigh")
*/
-- dogs

  local tempJob = {}

  tempJob.name = "%d dogs."
  tempJob.desc = "%d dogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "dogKilled"
  tempJob.numberRec = {3,5}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killDogsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d dogs."
  tempJob.desc = "%d dogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "dogKilled"
  tempJob.numberRec = {6,10}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killDogsHigh")

  tempJob = nil  

--fleshes

  local tempJob = {}

  tempJob.name = "%d fleshes."
  tempJob.desc = "%d fleshes."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "fleshKilled"
  tempJob.numberRec = {3,5}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killFleshesLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d fleshes."
  tempJob.desc = "%d fleshes."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "fleshKilled"
  tempJob.numberRec = {6,10}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killFleshesHigh")

  tempJob = nil

-- pseudodogs

  local tempJob = {}

  tempJob.name = "%d pseudodogs."
  tempJob.desc = "%d pseudodogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 1
  tempJob.listenTrigger = "pseudodogKilled"
  tempJob.numberRec = {1,3}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 10

  ix.jobs.register(tempJob, "killPseudodogsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d pseudodogs."
  tempJob.desc = "%d pseudodogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "pseudodogKilled"
  tempJob.numberRec = {3,5}
  tempJob.reward = {{"kit_quest2"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killPseudodogsHigh")

  tempJob = nil

-- psydogs
/*
  local tempJob = {}

  tempJob.name = "%d psydogs."
  tempJob.desc = "%d psydogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 2
  tempJob.listenTrigger = "psydogKilled"
  tempJob.numberRec = {1,1}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killPsydogsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d psydogs."
  tempJob.desc = "%d psydogs."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "psydogKilled"
  tempJob.numberRec = {2,3}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killPsydogsLow")

  tempJob = nil

-- Pseudogiants

  local tempJob = {}

  tempJob.name = "%d pseudogiants."
  tempJob.desc = "%d pseudogiants."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 3
  tempJob.listenTrigger = "pseudogiantKilled"
  tempJob.numberRec = {1,2}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 15

  ix.jobs.register(tempJob, "killPseudogiantsLow")

  tempJob = nil

  local tempJob = {}

  tempJob.name = "%d pseudogiants."
  tempJob.desc = "%d pseudogiants."
  tempJob.icon = "stalker/questpaper_mutant.png"
  tempJob.tier = 4
  tempJob.listenTrigger = "pseudogiantKilled"
  tempJob.numberRec = {2,3}
  tempJob.reward = {{"kit_quest1"}}
  tempJob.rewardCount = {1,1}
  tempJob.repReward = 20

  ix.jobs.register(tempJob, "killPseudogiantsHigh")

  tempJob = nil
*/
end