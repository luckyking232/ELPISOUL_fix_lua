require("Watch_BatchRegionByName")
require("Watch_Batch_WordByName")

function GetWatch_SetUis(ui)
  local uis = {}
  uis.HeadList = ui:GetChild("HeadList")
  uis.BatchRegion = GetWatch_BatchRegionUis(ui:GetChild("BatchRegion"))
  uis.SortBtn = ui:GetChild("SortBtn")
  uis.PositionBtn = ui:GetChild("PositionBtn")
  uis.ClothesBtn = ui:GetChild("ClothesBtn")
  uis.TabList = ui:GetChild("TabList")
  uis.Word = GetWatch_Batch_WordUis(ui:GetChild("Word"))
  uis.root = ui
  return uis
end
