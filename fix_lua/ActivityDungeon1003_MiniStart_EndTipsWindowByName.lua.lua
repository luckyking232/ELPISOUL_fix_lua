require("ActivityDungeon1003_MiniStart_EndTipsByName")

function GetActivityDungeon1003_MiniStart_EndTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniStart_EndTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
