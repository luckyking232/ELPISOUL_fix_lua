require("ActivityDungeon1020_MiniGameByName")

function GetActivityDungeon1020_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
