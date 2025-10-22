require("ActivityDungeon1010_MiniStart_ItemByName")

function GetActivityDungeon1010_MiniStart_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1010_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
