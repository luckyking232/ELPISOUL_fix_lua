require("ActivityDungeon1004_MiniGameStartByName")

function GetActivityDungeon1004_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
