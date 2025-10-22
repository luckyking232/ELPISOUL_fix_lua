require("ActivityDungeon1022_PassportByName")

function GetActivityDungeon1022_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
