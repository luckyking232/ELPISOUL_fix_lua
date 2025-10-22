function GetActivityDungeon1005_MiniGameChoice_TipsBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.mapCtr = ui:GetController("map")
  uis.root = ui
  return uis
end
