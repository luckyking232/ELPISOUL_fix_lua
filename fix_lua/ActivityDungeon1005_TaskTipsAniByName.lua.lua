require("ActivityDungeon1005_TaskTipsByName")

function GetActivityDungeon1005_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1005_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
