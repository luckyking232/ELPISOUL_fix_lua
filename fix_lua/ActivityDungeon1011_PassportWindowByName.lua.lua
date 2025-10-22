require("ActivityDungeon1011_PassportByName")

function GetActivityDungeon1011_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
