require("ActivityDungeon1004_MiniStart_WinTargetByName")

function GetActivityDungeon1004_MiniStart_WinTargetWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniStart_WinTargetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
