require("ActivityDungeon1015_PassportByName")

function GetActivityDungeon1015_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
