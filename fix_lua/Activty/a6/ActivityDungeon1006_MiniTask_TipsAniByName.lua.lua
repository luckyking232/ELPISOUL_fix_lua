require("ActivityDungeon1006_MiniTask_TipsByName")

function GetActivityDungeon1006_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
