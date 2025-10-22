require("ActivityDungeon1016_Plot_TipsByName")

function GetActivityDungeon1016_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1016_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
