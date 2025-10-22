require("ActivityDungeon1003_MiniIntegral_TipsByName")

function GetActivityDungeon1003_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1003_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
