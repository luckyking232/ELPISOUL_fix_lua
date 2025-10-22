require("ActivityDungeon1005_PassTask_TipsByName")

function GetActivityDungeon1005_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1005_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
