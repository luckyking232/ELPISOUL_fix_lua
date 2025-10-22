require("ActivityDungeon1022_MiniGameStartByName")

function GetActivityDungeon1022_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
