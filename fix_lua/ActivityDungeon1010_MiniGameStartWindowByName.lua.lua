require("ActivityDungeon1010_MiniGameStartByName")

function GetActivityDungeon1010_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
