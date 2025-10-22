require("ActivityDungeon1017_Plot_TipsByName")

function GetActivityDungeon1017_Plot_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1017_Plot_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
