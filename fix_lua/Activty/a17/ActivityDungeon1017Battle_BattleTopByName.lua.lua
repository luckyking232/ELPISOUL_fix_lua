require("ActivityDungeon1017Battle_NumberByName")
require("ActivityDungeon1017Battle_ExpByName")
require("ActivityDungeon1017Battle_TimeByName")
require("ActivityDungeon1017Battle_ProgressByName")

function GetActivityDungeon1017Battle_BattleTopUis(ui)
  local uis = {}
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.PauseBtn = ui:GetChild("PauseBtn")
  uis.SpeedBtn = ui:GetChild("SpeedBtn")
  uis.Number = GetActivityDungeon1017Battle_NumberUis(ui:GetChild("Number"))
  uis.Exp = GetActivityDungeon1017Battle_ExpUis(ui:GetChild("Exp"))
  uis.Time = GetActivityDungeon1017Battle_TimeUis(ui:GetChild("Time"))
  uis.Progress = GetActivityDungeon1017Battle_ProgressUis(ui:GetChild("Progress"))
  uis.root = ui
  return uis
end
