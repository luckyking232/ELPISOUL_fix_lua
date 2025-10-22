function GetSchedule_LeftModulePicUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
