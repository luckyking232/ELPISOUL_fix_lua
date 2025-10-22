require("ActivityDungeon1020_MiniStart_InitialPositionByName")

function GetActivityDungeon1020_MiniStart_OperateRegionUis(ui)
  local uis = {}
  uis.P01 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P01"))
  uis.P02 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P02"))
  uis.P03 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P03"))
  uis.P04 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P04"))
  uis.P05 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P05"))
  uis.P06 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P06"))
  uis.P07 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P07"))
  uis.P08 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P08"))
  uis.P09 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P09"))
  uis.P10 = GetActivityDungeon1020_MiniStart_InitialPositionUis(ui:GetChild("P10"))
  uis.root = ui
  return uis
end
