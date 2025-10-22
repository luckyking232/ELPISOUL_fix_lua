require("ActivityDungeon1012_SignByName")

function GetActivityDungeon1012_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
