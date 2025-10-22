require("ActivityDungeon1014_PassportByName")

function GetActivityDungeon1014_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
