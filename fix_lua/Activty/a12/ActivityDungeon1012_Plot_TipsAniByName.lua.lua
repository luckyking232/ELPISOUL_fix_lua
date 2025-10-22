require("ActivityDungeon1012_Plot_TipsByName")

function GetActivityDungeon1012_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1012_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
