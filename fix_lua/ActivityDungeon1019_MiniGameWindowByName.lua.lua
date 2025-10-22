require("ActivityDungeon1019_MiniGameByName")

function GetActivityDungeon1019_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
