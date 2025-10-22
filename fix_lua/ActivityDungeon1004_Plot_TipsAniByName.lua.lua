require("ActivityDungeon1004_Plot_TipsByName")

function GetActivityDungeon1004_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
