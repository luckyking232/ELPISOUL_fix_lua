require("ActivityDungeon1012_PassTask_TipsByName")

function GetActivityDungeon1012_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1012_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
