require("ActivityDungeon1017_MiniGameStartByName")

function GetActivityDungeon1017_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
