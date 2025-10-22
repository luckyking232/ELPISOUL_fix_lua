require("ActivityDungeon1006_Plot_TipsByName")

function GetActivityDungeon1006_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
