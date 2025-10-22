require("ActivityDungeon1017_TaskTipsByName")

function GetActivityDungeon1017_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1017_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
