require("ActivityDungeon1022_MiniStart_ItemByName")

function GetActivityDungeon1022_MiniStart_BlockUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1022_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.colorCtr = ui:GetController("color")
  uis.c2Ctr = ui:GetController("c2")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
