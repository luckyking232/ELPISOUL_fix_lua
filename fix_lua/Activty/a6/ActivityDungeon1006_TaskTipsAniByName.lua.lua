require("ActivityDungeon1006_TaskTipsByName")

function GetActivityDungeon1006_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1006_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
