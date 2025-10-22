require("ActivityDungeon1008_MiniGameByName")

function GetActivityDungeon1008_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
