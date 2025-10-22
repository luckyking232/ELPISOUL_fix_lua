require("ActivityDungeon1021_PassTask_TipsByName")

function GetActivityDungeon1021_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1021_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
