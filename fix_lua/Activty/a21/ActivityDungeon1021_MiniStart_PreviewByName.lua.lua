require("ActivityDungeon1021_MiniStart_PreviewBlockByName")

function GetActivityDungeon1021_MiniStart_PreviewUis(ui)
  local uis = {}
  uis.Position = GetActivityDungeon1021_MiniStart_PreviewBlockUis(ui:GetChild("Position"))
  uis.root = ui
  return uis
end
