require("ActivityDungeon1016_PassportByName")

function GetActivityDungeon1016_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
