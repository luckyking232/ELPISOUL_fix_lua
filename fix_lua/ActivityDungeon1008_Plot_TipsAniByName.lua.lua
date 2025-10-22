require("ActivityDungeon1008_Plot_TipsByName")

function GetActivityDungeon1008_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1008_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
