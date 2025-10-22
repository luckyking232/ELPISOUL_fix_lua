require("ActivityDungeon1014_Plot_TipsByName")

function GetActivityDungeon1014_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1014_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
