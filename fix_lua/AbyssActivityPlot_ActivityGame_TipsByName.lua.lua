require("AbyssActivityPlot_ActivityGame_LockByName")

function GetAbyssActivityPlot_ActivityGame_TipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EntryList = ui:GetChild("EntryList")
  uis.Lock = GetAbyssActivityPlot_ActivityGame_LockUis(ui:GetChild("Lock"))
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
