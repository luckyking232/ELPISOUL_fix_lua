require("ActivityDungeon1015_Plot_TipsByName")

function GetActivityDungeon1015_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1015_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
