require("ActivityDungeon1010_PassportByName")

function GetActivityDungeon1010_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
