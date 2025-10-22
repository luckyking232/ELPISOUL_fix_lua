require("ActivityDungeon1005_MiniStart_EndPointByName")
require("ActivityDungeon1005_MiniStart_StartingPointByName")
require("ActivityDungeon1005_MiniStart_NextBallByName")

function GetActivityDungeon1005_MiniGame_Map06Uis(ui)
  local uis = {}
  uis.EndPoint1 = GetActivityDungeon1005_MiniStart_EndPointUis(ui:GetChild("EndPoint1"))
  uis.EndPoint2 = GetActivityDungeon1005_MiniStart_EndPointUis(ui:GetChild("EndPoint2"))
  uis.StartingPoint1 = GetActivityDungeon1005_MiniStart_StartingPointUis(ui:GetChild("StartingPoint1"))
  uis.StartingPoint2 = GetActivityDungeon1005_MiniStart_StartingPointUis(ui:GetChild("StartingPoint2"))
  uis.NextBall = GetActivityDungeon1005_MiniStart_NextBallUis(ui:GetChild("NextBall"))
  uis.root = ui
  return uis
end
