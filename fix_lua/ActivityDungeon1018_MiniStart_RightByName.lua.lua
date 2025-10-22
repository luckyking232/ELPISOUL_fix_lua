require("ActivityDungeon1018_MiniStart_DragBlockByName")

function GetActivityDungeon1018_MiniStart_RightUis(ui)
  local uis = {}
  uis.DragBlock = GetActivityDungeon1018_MiniStart_DragBlockUis(ui:GetChild("DragBlock"))
  uis.root = ui
  return uis
end
