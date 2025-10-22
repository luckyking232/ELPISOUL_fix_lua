require("ActivityCasket_CasketByName")

function GetActivityCasket_CasketWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket_CasketUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
