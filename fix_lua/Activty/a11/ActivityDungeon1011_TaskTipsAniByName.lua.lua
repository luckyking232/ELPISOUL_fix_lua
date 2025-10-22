require("ActivityDungeon1011_TaskTipsByName")

function GetActivityDungeon1011_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1011_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
