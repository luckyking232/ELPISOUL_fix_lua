require("Message_ExploreGetTipsByName")

function GetMessage_ExploreGetTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_ExploreGetTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
