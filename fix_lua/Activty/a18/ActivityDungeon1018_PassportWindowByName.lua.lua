require("ActivityDungeon1018_PassportByName")

function GetActivityDungeon1018_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
