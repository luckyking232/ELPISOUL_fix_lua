require("ActivityDungeon1019_TaskTipsByName")

function GetActivityDungeon1019_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1019_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
