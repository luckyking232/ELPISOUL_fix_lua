require("ActivityDungeon1003_Plot_TipsByName")

function GetActivityDungeon1003_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1003_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
