require("Watch_Special_MoveWordByName")

function GetWatch_Special_SignUis(ui)
  local uis = {}
  uis.MoveWord = GetWatch_Special_MoveWordUis(ui:GetChild("MoveWord"))
  uis.root = ui
  return uis
end
