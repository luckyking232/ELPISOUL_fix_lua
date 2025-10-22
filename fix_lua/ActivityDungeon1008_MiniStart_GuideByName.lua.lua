require("ActivityDungeon1008_MiniStart_ItemByName")

function GetActivityDungeon1008_MiniStart_GuideUis(ui)
  local uis = {}
  uis.ArrowImage = ui:GetChild("ArrowImage")
  uis.Item = GetActivityDungeon1008_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
