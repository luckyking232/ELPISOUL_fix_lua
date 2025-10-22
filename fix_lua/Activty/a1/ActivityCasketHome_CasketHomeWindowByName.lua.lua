require("ActivityCasketHome_CasketHomeByName")

function GetActivityCasketHome_CasketHomeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasketHome_CasketHomeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
