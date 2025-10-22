require("Schedule_BoxGetTipsEntryListByName")

function GetSchedule_BoxGetTipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.EntryList = GetSchedule_BoxGetTipsEntryListUis(ui:GetChild("EntryList"))
  uis.root = ui
  return uis
end
