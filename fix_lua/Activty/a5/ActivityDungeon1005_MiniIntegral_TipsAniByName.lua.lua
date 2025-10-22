require("ActivityDungeon1005_MiniIntegral_TipsByName")

function GetActivityDungeon1005_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1005_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
