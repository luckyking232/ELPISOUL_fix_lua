require("ActivityDungeon1013_TaskTipsByName")

function GetActivityDungeon1013_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1013_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
