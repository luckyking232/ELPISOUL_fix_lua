require("ActivityDungeon1003_TaskTipsByName")

function GetActivityDungeon1003_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1003_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
