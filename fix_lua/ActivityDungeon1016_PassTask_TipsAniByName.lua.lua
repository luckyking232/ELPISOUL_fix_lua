require("ActivityDungeon1016_PassTask_TipsByName")

function GetActivityDungeon1016_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1016_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
