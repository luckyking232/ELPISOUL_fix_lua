require("Watch_Special_MoveWord1ByName")

function GetWatch_Special_LockUis(ui)
  local uis = {}
  uis.MoveWord = GetWatch_Special_MoveWord1Uis(ui:GetChild("MoveWord"))
  uis.root = ui
  return uis
end
