require("ActivityDungeon1008_SignByName")

function GetActivityDungeon1008_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
