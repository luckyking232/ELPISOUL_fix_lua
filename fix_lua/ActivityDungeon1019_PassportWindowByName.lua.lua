require("ActivityDungeon1019_PassportByName")

function GetActivityDungeon1019_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
