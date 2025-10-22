require("Schedule_RightModule_BuildByName")
require("Schedule_RightModule_SuperByName")
require("Schedule_RightModule_RogueByName")
require("Schedule_RightModule_BoxByName")
require("Schedule_RightModule_ExploreByName")
require("Schedule_RightModule_DailyTaskByName")
require("Schedule_RightModule_ArenaByName")
require("Schedule_RightModule_InitialEnergyByName")
require("Schedule_RightModule_ExploreDungeonByName")

function GetSchedule_RightModuleUis(ui)
  local uis = {}
  uis.Build = GetSchedule_RightModule_BuildUis(ui:GetChild("Build"))
  uis.Super = GetSchedule_RightModule_SuperUis(ui:GetChild("Super"))
  uis.Rogue = GetSchedule_RightModule_RogueUis(ui:GetChild("Rogue"))
  uis.Box = GetSchedule_RightModule_BoxUis(ui:GetChild("Box"))
  uis.Explore = GetSchedule_RightModule_ExploreUis(ui:GetChild("Explore"))
  uis.DailyTask = GetSchedule_RightModule_DailyTaskUis(ui:GetChild("DailyTask"))
  uis.Arena = GetSchedule_RightModule_ArenaUis(ui:GetChild("Arena"))
  uis.InitialEnergy = GetSchedule_RightModule_InitialEnergyUis(ui:GetChild("InitialEnergy"))
  uis.ExploreDungeon = GetSchedule_RightModule_ExploreDungeonUis(ui:GetChild("ExploreDungeon"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
