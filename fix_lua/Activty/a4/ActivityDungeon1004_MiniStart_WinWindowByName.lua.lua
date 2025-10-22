require("ActivityDungeon1004_MiniStart_WinByName")

function GetActivityDungeon1004_MiniStart_WinWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniStart_WinUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
