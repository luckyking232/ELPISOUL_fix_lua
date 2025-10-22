require("ActivityDungeon1003_PassportByName")

function GetActivityDungeon1003_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
