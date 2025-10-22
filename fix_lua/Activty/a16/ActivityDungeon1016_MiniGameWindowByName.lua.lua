require("ActivityDungeon1016_MiniGameByName")

function GetActivityDungeon1016_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
