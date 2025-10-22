require("ActivityDungeon1021_PassportByName")

function GetActivityDungeon1021_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
