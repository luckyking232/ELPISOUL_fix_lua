require("ActivityDungeon1018_Plot_TipsByName")

function GetActivityDungeon1018_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1018_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
