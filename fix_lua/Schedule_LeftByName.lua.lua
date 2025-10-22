require("Schedule_LeftModuleLoadingByName")

function GetSchedule_LeftUis(ui)
  local uis = {}
  uis.LeftRegionList = ui:GetChild("LeftRegionList")
  uis.PageNumberList = ui:GetChild("PageNumberList")
  uis.Loading = GetSchedule_LeftModuleLoadingUis(ui:GetChild("Loading"))
  uis.c1Ctr = ui:GetController("c1")
  uis.loadingCtr = ui:GetController("loading")
  uis.root = ui
  return uis
end
