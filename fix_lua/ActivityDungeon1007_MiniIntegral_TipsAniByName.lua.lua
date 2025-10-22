require("ActivityDungeon1007_MiniIntegral_TipsByName")

function GetActivityDungeon1007_MiniIntegral_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1007_MiniIntegral_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
