require("ActivityDungeon1012_MiniIntegral_TipsByName")

function GetActivityDungeon1012_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1012_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
