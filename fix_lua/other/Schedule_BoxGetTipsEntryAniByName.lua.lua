require("Schedule_BoxGetTipsEntryByName")

function GetSchedule_BoxGetTipsEntryAniUis(ui)
  local uis = {}
  uis.Entry = GetSchedule_BoxGetTipsEntryUis(ui:GetChild("Entry"))
  uis.root = ui
  return uis
end
