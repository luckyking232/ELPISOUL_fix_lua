require("ActivityDungeon1012_MiniCompleteByName")

function GetActivityDungeon1012_MiniCompleteWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniCompleteUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
