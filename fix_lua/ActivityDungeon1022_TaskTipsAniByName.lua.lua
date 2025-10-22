require("ActivityDungeon1022_TaskTipsByName")

function GetActivityDungeon1022_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1022_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
