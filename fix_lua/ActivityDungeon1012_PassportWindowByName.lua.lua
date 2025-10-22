require("ActivityDungeon1012_PassportByName")

function GetActivityDungeon1012_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
