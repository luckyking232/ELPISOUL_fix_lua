require("ActivityDungeon1004_PassportByName")

function GetActivityDungeon1004_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
