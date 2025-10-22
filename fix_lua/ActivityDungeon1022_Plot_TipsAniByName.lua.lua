require("ActivityDungeon1022_Plot_TipsByName")

function GetActivityDungeon1022_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1022_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
