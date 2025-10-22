require("ActivityDungeon1017_MiniGame2ByName")

function GetActivityDungeon1017_MiniGame2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniGame2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
