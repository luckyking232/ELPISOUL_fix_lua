require("ActivityDungeon1017Battle_DPSInfoSwitchByName")
require("ActivityDungeon1017Battle_BuildHPByName")

function GetActivityDungeon1017Battle_BottomUis(ui)
  local uis = {}
  uis.DPSInfoSwitch = GetActivityDungeon1017Battle_DPSInfoSwitchUis(ui:GetChild("DPSInfoSwitch"))
  uis.BuildHP = GetActivityDungeon1017Battle_BuildHPUis(ui:GetChild("BuildHP"))
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
