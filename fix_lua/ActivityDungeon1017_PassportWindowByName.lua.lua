require("ActivityDungeon1017_PassportByName")

function GetActivityDungeon1017_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
