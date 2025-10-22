require("ActivityDungeon1011_MiniStart_BeadRegionByName")
require("ActivityDungeon1011_MiniStart_BoxShadeByName")

function GetActivityDungeon1011_MiniStart_BoxRegionUis(ui)
  local uis = {}
  uis.BeadRegion = GetActivityDungeon1011_MiniStart_BeadRegionUis(ui:GetChild("BeadRegion"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.BoxShade = GetActivityDungeon1011_MiniStart_BoxShadeUis(ui:GetChild("BoxShade"))
  uis.root = ui
  return uis
end
