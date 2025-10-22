function GetSchedule_BoxGetTipsEntryListUis(ui)
  local uis = {}
  
  uis.EntryList = ui:GetChild("EntryList")
  uis.root = ui
  return uis
end
