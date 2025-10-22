require("ActivityDungeon1017_SignByName")

function GetActivityDungeon1017_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
