require("ActivityDungeon1021_Plot_TipsByName")

function GetActivityDungeon1021_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1021_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
