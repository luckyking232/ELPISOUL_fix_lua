require("ActivityDungeon1020_TaskTipsByName")

function GetActivityDungeon1020_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1020_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
