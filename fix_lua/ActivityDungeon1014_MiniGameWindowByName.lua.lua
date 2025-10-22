require("ActivityDungeon1014_MiniGameByName")

function GetActivityDungeon1014_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
