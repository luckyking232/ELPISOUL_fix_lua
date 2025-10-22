require("Schedule_LeftModuleLockWordByName")

function GetSchedule_LeftModuleLockUis(ui)
  local uis = {}
  uis.MoveWord = GetSchedule_LeftModuleLockWordUis(ui:GetChild("MoveWord"))
  uis.root = ui
  return uis
end
