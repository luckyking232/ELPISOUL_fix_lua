require("ActivityDungeon1005_MiniGameByName")

function GetActivityDungeon1005_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
