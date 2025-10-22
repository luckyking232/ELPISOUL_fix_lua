require("ActivityDungeon1013_MiniGameStartByName")

function GetActivityDungeon1013_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
