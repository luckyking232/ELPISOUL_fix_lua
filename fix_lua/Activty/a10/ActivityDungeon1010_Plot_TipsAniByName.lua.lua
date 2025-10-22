require("ActivityDungeon1010_Plot_TipsByName")

function GetActivityDungeon1010_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1010_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
