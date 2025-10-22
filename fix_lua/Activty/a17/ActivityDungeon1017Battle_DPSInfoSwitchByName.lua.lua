require("ActivityDungeon1017Battle_DPS1RegionByName")

function GetActivityDungeon1017Battle_DPSInfoSwitchUis(ui)
  local uis = {}
  uis.DPS1 = GetActivityDungeon1017Battle_DPS1RegionUis(ui:GetChild("DPS1"))
  uis.root = ui
  return uis
end
