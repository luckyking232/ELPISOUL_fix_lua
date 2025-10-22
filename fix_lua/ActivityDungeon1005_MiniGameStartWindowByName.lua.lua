require("ActivityDungeon1005_MiniGameStartByName")

function GetActivityDungeon1005_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
