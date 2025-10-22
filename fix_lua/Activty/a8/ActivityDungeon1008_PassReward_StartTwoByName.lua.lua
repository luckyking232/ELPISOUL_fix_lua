require("ActivityDungeon1008_PassReward_PicByName")

function GetActivityDungeon1008_PassReward_StartTwoUis(ui)
  local uis = {}
  uis.Pic = GetActivityDungeon1008_PassReward_PicUis(ui:GetChild("Pic"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
