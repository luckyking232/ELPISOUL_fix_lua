require("ActivityDungeon1006_MiniStart_ItemByName")

function GetActivityDungeon1006_MiniStart_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1006_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
