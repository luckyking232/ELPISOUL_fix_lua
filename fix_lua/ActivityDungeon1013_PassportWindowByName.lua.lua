require("ActivityDungeon1013_PassportByName")

function GetActivityDungeon1013_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
