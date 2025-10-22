require("ActivityDungeon1003_MiniGameByName")

function GetActivityDungeon1003_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
