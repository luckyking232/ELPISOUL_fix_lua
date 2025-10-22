require("ActivityDungeon1007_TaskTipsByName")

function GetActivityDungeon1007_TaskTipsAniUis(ui)
  local uis = {}
  uis.TaskTips = GetActivityDungeon1007_TaskTipsUis(ui:GetChild("TaskTips"))
  uis.root = ui
  return uis
end
