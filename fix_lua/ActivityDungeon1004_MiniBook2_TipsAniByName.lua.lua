require("ActivityDungeon1004_MiniBook2_TipsByName")

function GetActivityDungeon1004_MiniBook2_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_MiniBook2_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
