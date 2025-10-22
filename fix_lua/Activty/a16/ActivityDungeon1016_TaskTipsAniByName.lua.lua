require("ActivityDungeon1016_TaskTipsByName")

function GetActivityDungeon1016_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1016_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
