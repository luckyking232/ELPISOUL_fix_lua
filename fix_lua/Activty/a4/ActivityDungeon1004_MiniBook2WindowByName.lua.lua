require("ActivityDungeon1004_MiniBook2ByName")

function GetActivityDungeon1004_MiniBook2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniBook2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
