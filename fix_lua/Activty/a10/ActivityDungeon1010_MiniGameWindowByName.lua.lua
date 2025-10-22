require("ActivityDungeon1010_MiniGameByName")

function GetActivityDungeon1010_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
