require("ActivityDungeon1013_PassTask_TipsByName")

function GetActivityDungeon1013_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1013_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
