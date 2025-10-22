require("ActivityDungeon1008_PassportByName")

function GetActivityDungeon1008_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
