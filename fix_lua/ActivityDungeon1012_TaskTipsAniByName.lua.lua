require("ActivityDungeon1012_TaskTipsByName")

function GetActivityDungeon1012_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1012_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
