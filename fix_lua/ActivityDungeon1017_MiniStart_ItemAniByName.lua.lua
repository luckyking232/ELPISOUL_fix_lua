require("ActivityDungeon1017_MiniStart_ItemByName")

function GetActivityDungeon1017_MiniStart_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1017_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
