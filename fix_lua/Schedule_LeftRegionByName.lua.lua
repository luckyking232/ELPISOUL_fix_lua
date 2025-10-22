require("Schedule_LeftModule1ByName")

function GetSchedule_LeftRegionUis(ui)
  local uis = {}
  uis.Module1 = GetSchedule_LeftModule1Uis(ui:GetChild("Module1"))
  uis.Module2 = GetSchedule_LeftModule1Uis(ui:GetChild("Module2"))
  uis.Module3 = GetSchedule_LeftModule1Uis(ui:GetChild("Module3"))
  uis.Module4 = GetSchedule_LeftModule1Uis(ui:GetChild("Module4"))
  uis.root = ui
  return uis
end
