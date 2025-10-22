require("ActivityDungeon1011_MiniGameStartByName")

function GetActivityDungeon1011_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
