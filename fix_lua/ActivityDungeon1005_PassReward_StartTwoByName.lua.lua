require("ActivityDungeon1005_PassReward_PicByName")

function GetActivityDungeon1005_PassReward_StartTwoUis(ui)
  local uis = {}
  uis.Pic = GetActivityDungeon1005_PassReward_PicUis(ui:GetChild("Pic"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
