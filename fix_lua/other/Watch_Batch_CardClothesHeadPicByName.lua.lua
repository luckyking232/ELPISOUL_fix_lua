function GetWatch_Batch_CardClothesHeadPicUis(ui)
  local uis = {}
  
  uis.HeadLoader = ui:GetChild("HeadLoader")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
