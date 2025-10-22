require("ActivityDungeon1017_MiniGameByName")

function GetActivityDungeon1017_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
