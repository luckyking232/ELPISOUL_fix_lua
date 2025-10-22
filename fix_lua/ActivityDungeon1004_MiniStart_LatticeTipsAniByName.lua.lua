require("ActivityDungeon1004_MiniStart_LatticeTipsByName")

function GetActivityDungeon1004_MiniStart_LatticeTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_MiniStart_LatticeTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
