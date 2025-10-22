require("ActivityDungeon1003_MiniGameStartByName")

function GetActivityDungeon1003_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
