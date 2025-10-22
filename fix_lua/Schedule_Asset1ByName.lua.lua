require("Schedule_AssetTitleByName")

function GetSchedule_Asset1Uis(ui)
  local uis = {}
  uis.Title1 = GetSchedule_AssetTitleUis(ui:GetChild("Title1"))
  uis.AssetList = ui:GetChild("AssetList")
  uis.Title2 = GetSchedule_AssetTitleUis(ui:GetChild("Title2"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
