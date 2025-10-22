require("ActivityDungeon1007_SignByName")

function GetActivityDungeon1007_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
