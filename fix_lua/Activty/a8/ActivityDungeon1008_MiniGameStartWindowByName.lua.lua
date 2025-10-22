require("ActivityDungeon1008_MiniGameStartByName")

function GetActivityDungeon1008_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
