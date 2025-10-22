require("ActivityDungeon1008_MiniIntegral_TipsByName")

function GetActivityDungeon1008_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1008_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
