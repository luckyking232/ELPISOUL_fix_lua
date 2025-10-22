require("ActivityDungeon1007_MiniStart_ItemByName")

function GetActivityDungeon1007_MiniStart_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1007_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
