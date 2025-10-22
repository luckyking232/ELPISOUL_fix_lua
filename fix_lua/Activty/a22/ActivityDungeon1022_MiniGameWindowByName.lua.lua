require("ActivityDungeon1022_MiniGameByName")

function GetActivityDungeon1022_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
