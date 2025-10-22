require("ActivityDungeon1020_MiniGameStartByName")

function GetActivityDungeon1020_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
