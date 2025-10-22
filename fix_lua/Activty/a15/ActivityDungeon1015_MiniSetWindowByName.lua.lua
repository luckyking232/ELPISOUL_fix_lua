require("ActivityDungeon1015_MiniSetByName")

function GetActivityDungeon1015_MiniSetWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniSetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
