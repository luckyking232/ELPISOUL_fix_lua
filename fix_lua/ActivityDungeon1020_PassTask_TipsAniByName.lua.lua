require("ActivityDungeon1020_PassTask_TipsByName")

function GetActivityDungeon1020_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1020_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
