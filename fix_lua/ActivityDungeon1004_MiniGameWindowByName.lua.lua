require("ActivityDungeon1004_MiniGameByName")

function GetActivityDungeon1004_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
