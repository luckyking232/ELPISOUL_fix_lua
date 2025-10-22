require("ActivityDungeon1006_MiniIntegral_TipsByName")

function GetActivityDungeon1006_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
