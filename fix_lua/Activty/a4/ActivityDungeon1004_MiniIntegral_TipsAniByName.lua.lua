require("ActivityDungeon1004_MiniIntegral_TipsByName")

function GetActivityDungeon1004_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
