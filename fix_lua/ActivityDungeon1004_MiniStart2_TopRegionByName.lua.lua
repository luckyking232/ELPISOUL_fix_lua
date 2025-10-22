require("ActivityDungeon1004_MiniStart2_HarvestByName")
require("ActivityDungeon1004_MiniStart2_NumberByName")

function GetActivityDungeon1004_MiniStart2_TopRegionUis(ui)
  local uis = {}
  uis.HarvestProgressBar = ui:GetChild("HarvestProgressBar")
  uis.NumberProgressBar = ui:GetChild("NumberProgressBar")
  uis.Harvest = GetActivityDungeon1004_MiniStart2_HarvestUis(ui:GetChild("Harvest"))
  uis.Number = GetActivityDungeon1004_MiniStart2_NumberUis(ui:GetChild("Number"))
  uis.BookBtn = ui:GetChild("BookBtn")
  uis.root = ui
  return uis
end
