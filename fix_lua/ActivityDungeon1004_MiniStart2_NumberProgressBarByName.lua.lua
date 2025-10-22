require("ActivityDungeon1004_MiniStart2_NumberProgressFillByName")

function GetActivityDungeon1004_MiniStart2_NumberProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1004_MiniStart2_NumberProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
