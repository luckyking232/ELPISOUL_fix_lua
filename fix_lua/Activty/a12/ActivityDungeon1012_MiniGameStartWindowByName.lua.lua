require("ActivityDungeon1012_MiniGameStartByName")

function GetActivityDungeon1012_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
