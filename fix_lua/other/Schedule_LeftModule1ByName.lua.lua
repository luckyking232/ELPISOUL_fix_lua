require("Schedule_LeftModuleByName")

function GetSchedule_LeftModule1Uis(ui)
  local uis = {}
  uis.LeftModule = GetSchedule_LeftModuleUis(ui:GetChild("LeftModule"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
