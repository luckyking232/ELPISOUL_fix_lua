require("AbyssActivityPlot_ActivityGame_TipsByName")

function GetAbyssActivityPlot_ActivityGame_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetAbyssActivityPlot_ActivityGame_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
