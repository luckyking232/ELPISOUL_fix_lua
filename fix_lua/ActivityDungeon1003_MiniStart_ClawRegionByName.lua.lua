require("ActivityDungeon1003_MiniStart_ClawLineByName")

function GetActivityDungeon1003_MiniStart_ClawRegionUis(ui)
  local uis = {}
  uis.Line = GetActivityDungeon1003_MiniStart_ClawLineUis(ui:GetChild("Line"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.root = ui
  return uis
end
