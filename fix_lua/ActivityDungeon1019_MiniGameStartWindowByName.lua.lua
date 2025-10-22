require("ActivityDungeon1019_MiniGameStartByName")

function GetActivityDungeon1019_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
