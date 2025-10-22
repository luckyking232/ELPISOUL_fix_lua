require("ActivityDungeon1021_MiniGameStartByName")

function GetActivityDungeon1021_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
