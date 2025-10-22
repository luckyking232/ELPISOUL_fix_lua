require("ActivityDungeon1015_MiniGameByName")

function GetActivityDungeon1015_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
