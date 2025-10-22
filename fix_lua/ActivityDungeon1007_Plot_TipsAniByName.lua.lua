require("ActivityDungeon1007_Plot_TipsByName")

function GetActivityDungeon1007_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1007_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
