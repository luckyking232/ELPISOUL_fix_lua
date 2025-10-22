require("ActivityDungeon1020_PassportByName")

function GetActivityDungeon1020_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
