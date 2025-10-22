require("ActivityDungeon1005_PassportByName")

function GetActivityDungeon1005_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
