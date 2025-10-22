require("Schedule_CycleModulePicByName")

function GetSchedule_CycleModuleUis(ui)
  local uis = {}
  uis.Pic = GetSchedule_CycleModulePicUis(ui:GetChild("Pic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
