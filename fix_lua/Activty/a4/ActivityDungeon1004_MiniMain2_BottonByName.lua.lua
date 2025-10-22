require("ActivityDungeon1004_MiniMain2_TodayTaskByName")

function GetActivityDungeon1004_MiniMain2_BottonUis(ui)
  local uis = {}
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.TodayTask = GetActivityDungeon1004_MiniMain2_TodayTaskUis(ui:GetChild("TodayTask"))
  uis.root = ui
  return uis
end
