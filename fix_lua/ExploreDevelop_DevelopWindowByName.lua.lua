require("ExploreDevelop_DevelopByName")

function GetExploreDevelop_DevelopWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDevelop_DevelopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
