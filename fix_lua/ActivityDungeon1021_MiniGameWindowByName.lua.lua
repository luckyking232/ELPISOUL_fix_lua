require("ActivityDungeon1021_MiniGameByName")

function GetActivityDungeon1021_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
