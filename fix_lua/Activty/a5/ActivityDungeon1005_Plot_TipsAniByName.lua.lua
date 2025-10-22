require("ActivityDungeon1005_Plot_TipsByName")

function GetActivityDungeon1005_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1005_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
