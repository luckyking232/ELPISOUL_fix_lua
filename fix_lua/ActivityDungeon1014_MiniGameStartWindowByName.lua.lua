require("ActivityDungeon1014_MiniGameStartByName")

function GetActivityDungeon1014_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
