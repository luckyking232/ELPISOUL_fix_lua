require("ActivityDungeon1010_TaskTipsByName")

function GetActivityDungeon1010_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1010_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
