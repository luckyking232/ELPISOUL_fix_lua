require("ActivityDungeon1017_MiniGameChoice2ByName")

function GetActivityDungeon1017_MiniGameChoice2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniGameChoice2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
