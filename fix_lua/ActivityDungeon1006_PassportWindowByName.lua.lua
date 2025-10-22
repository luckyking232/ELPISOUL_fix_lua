require("ActivityDungeon1006_PassportByName")

function GetActivityDungeon1006_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
