require("ActivityDungeon1006_MiniGameByName")

function GetActivityDungeon1006_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
