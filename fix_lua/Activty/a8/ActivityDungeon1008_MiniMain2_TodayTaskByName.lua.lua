require("ActivityDungeon1008_PassReward_AllFrame_EByName")
require("CommonResource_RedDotByName")

function GetActivityDungeon1008_MiniMain2_TodayTaskUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1008_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
