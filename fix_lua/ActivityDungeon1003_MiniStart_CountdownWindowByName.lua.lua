require("ActivityDungeon1003_MiniStart_CountdownByName")

function GetActivityDungeon1003_MiniStart_CountdownWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniStart_CountdownUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
