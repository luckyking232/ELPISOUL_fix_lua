require("ActivityDungeon1013_Plot_TipsByName")

function GetActivityDungeon1013_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1013_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
