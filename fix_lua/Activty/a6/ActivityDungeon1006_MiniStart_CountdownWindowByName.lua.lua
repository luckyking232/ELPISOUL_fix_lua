require("ActivityDungeon1006_MiniStart_CountdownByName")

function GetActivityDungeon1006_MiniStart_CountdownWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniStart_CountdownUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
