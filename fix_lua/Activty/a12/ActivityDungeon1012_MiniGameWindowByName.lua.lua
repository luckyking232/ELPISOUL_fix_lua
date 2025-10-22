require("ActivityDungeon1012_MiniGameByName")

function GetActivityDungeon1012_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
