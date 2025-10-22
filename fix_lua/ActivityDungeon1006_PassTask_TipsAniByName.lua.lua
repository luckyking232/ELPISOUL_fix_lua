require("ActivityDungeon1006_PassTask_TipsByName")

function GetActivityDungeon1006_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
