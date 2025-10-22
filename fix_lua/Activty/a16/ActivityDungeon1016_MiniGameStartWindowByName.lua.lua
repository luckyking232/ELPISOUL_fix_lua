require("ActivityDungeon1016_MiniGameStartByName")

function GetActivityDungeon1016_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
