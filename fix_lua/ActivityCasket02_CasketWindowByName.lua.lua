require("ActivityCasket02_CasketByName")

function GetActivityCasket02_CasketWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket02_CasketUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
