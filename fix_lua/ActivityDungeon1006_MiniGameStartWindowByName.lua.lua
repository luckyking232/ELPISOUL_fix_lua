require("ActivityDungeon1006_MiniGameStartByName")

function GetActivityDungeon1006_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
