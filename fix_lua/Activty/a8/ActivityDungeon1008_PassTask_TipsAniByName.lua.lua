require("ActivityDungeon1008_PassTask_TipsByName")

function GetActivityDungeon1008_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1008_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
