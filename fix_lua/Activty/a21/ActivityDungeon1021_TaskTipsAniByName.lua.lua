require("ActivityDungeon1021_TaskTipsByName")

function GetActivityDungeon1021_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1021_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
