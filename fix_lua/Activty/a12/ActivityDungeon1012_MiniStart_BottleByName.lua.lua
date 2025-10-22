require("ActivityDungeon1012_MiniStart_PlantByName")

function GetActivityDungeon1012_MiniStart_BottleUis(ui)
  local uis = {}
  uis.Plant = GetActivityDungeon1012_MiniStart_PlantUis(ui:GetChild("Plant"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
