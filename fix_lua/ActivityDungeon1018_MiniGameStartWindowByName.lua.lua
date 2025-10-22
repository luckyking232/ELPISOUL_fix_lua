require("ActivityDungeon1018_MiniGameStartByName")

function GetActivityDungeon1018_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
