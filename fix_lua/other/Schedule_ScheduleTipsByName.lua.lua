require("Schedule_LeftByName")
require("Schedule_RightRegionByName")
require("Schedule_AssetByName")

function GetSchedule_ScheduleTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TabSignBtn = ui:GetChild("TabSignBtn")
  uis.RightWordTipsBtn = ui:GetChild("RightWordTipsBtn")
  uis.LeftRegion = GetSchedule_LeftUis(ui:GetChild("LeftRegion"))
  uis.RightRegion = GetSchedule_RightRegionUis(ui:GetChild("RightRegion"))
  uis.Asset = GetSchedule_AssetUis(ui:GetChild("Asset"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
