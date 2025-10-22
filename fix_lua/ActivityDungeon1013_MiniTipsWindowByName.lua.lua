require("ActivityDungeon1013_MiniTipsByName")

function GetActivityDungeon1013_MiniTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
