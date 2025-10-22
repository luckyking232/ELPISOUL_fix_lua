require("ActivityDungeon1013_MiniGameByName")

function GetActivityDungeon1013_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
