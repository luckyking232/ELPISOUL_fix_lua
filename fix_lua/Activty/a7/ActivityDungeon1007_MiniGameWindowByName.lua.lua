require("ActivityDungeon1007_MiniGameByName")

function GetActivityDungeon1007_MiniGameWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
