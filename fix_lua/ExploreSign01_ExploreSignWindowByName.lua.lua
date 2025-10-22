require("ExploreSign01_ExploreSignByName")

function GetExploreSign01_ExploreSignWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreSign01_ExploreSignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
