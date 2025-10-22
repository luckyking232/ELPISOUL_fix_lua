require("Card_QuickStarUpSuccessByName")

function GetCard_QuickStarUpSuccessWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_QuickStarUpSuccessUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
