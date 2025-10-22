require("ActivityDungeon1011_SignByName")

function GetActivityDungeon1011_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
