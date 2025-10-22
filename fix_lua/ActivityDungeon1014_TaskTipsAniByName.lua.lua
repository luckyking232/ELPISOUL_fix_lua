require("ActivityDungeon1014_TaskTipsByName")

function GetActivityDungeon1014_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1014_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
