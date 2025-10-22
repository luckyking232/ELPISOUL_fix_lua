require("ActivityDungeon1020_Plot_TipsByName")

function GetActivityDungeon1020_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1020_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
