require("ActivityDungeon1019_Plot_TipsByName")

function GetActivityDungeon1019_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1019_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
