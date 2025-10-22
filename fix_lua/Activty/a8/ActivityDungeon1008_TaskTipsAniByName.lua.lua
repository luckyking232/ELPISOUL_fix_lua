require("ActivityDungeon1008_TaskTipsByName")

function GetActivityDungeon1008_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1008_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
