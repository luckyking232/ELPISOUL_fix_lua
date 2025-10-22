require("ActivityDungeon1004_TaskTipsByName")

function GetActivityDungeon1004_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1004_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
