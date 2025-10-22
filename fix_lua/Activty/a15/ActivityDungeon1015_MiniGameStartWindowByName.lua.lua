require("ActivityDungeon1015_MiniGameStartByName")

function GetActivityDungeon1015_MiniGameStartWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniGameStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
