require("ActivityDungeon1018_MiniGameByName")

function GetActivityDungeon1018_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
