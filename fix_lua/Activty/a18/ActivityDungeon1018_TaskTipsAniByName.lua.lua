require("ActivityDungeon1018_TaskTipsByName")

function GetActivityDungeon1018_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1018_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
