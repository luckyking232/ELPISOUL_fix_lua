require("ActivityDungeon1017Battle_BuildHPProgressFillByName")

function GetActivityDungeon1017Battle_BuildHPProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017Battle_BuildHPProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
