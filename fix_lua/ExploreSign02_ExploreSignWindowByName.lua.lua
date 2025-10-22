require("ExploreSign02_ExploreSignByName")

function GetExploreSign02_ExploreSignWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreSign02_ExploreSignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
