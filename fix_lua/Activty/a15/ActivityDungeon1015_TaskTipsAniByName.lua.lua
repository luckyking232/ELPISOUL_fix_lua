require("ActivityDungeon1015_TaskTipsByName")

function GetActivityDungeon1015_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1015_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
