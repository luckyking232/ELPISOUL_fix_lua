require("ActivityDungeon1008_MiniStart_ItemByName")

function GetActivityDungeon1008_MiniStart_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1008_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
