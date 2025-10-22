require("ActivityDungeon1004_MiniStart2_HarvestProgressFillByName")

function GetActivityDungeon1004_MiniStart2_HarvestProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1004_MiniStart2_HarvestProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
