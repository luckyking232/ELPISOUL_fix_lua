require("ActivityDungeon1015_MiniTipsByName")

function GetActivityDungeon1015_MiniTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
