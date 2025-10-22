require("ActivityDungeon1013_MiniStart_LaunchInfoByName")
require("ActivityDungeon1013_MiniStart_LaunchBallByName")
require("ActivityDungeon1013_MiniStart_LaunchStaffByName")

function GetActivityDungeon1013_MiniStart_LaunchUis(ui)
  local uis = {}
  uis.Info1 = GetActivityDungeon1013_MiniStart_LaunchInfoUis(ui:GetChild("Info1"))
  uis.Info2 = GetActivityDungeon1013_MiniStart_LaunchInfoUis(ui:GetChild("Info2"))
  uis.Ball = GetActivityDungeon1013_MiniStart_LaunchBallUis(ui:GetChild("Ball"))
  uis.Staff = GetActivityDungeon1013_MiniStart_LaunchStaffUis(ui:GetChild("Staff"))
  uis.root = ui
  return uis
end
