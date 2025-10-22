require("ActivityCasket01_CasketByName")

function GetActivityCasket01_CasketWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket01_CasketUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
