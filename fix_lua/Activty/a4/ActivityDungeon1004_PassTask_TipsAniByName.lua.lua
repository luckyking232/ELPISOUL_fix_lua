require("ActivityDungeon1004_PassTask_TipsByName")

function GetActivityDungeon1004_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
