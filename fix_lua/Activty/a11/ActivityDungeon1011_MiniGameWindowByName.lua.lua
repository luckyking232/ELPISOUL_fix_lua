require("ActivityDungeon1011_MiniGameByName")

function GetActivityDungeon1011_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
