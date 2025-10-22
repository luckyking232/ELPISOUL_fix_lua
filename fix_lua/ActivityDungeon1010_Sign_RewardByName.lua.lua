require("ActivityDungeon1010_Sign_AllFrameByName")

function GetActivityDungeon1010_Sign_RewardUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1010_Sign_AllFrameUis(ui:GetChild("Item"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
