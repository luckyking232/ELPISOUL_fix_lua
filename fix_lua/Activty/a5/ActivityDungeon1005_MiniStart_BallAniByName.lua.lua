require("ActivityDungeon1005_MiniStart_BallByName")

function GetActivityDungeon1005_MiniStart_BallAniUis(ui)
  local uis = {}
  uis.Ball = GetActivityDungeon1005_MiniStart_BallUis(ui:GetChild("Ball"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
