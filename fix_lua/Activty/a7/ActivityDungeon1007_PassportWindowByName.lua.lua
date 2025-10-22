require("ActivityDungeon1007_PassportByName")

function GetActivityDungeon1007_PassportWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_PassportUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
