require("ActivityDungeon1012_MiniStart_PlantByName")

function GetActivityDungeon1012_MiniStart_ArrangeItemUis(ui)
  local uis = {}
  uis.Plant = GetActivityDungeon1012_MiniStart_PlantUis(ui:GetChild("Plant"))
  uis.root = ui
  return uis
end
