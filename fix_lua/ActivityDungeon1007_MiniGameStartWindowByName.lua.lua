require("ActivityDungeon1007_MiniGameStartByName")

function GetActivityDungeon1007_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
