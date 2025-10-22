require("ActivityCasketHome_CardPicByName")
require("ActivityCasketHome_StateByName")
require("ActivityCasketHome_TimeByName")

function GetActivityCasketHome_CardUis(ui)
  local uis = {}
  uis.Pic = GetActivityCasketHome_CardPicUis(ui:GetChild("Pic"))
  uis.SignList = ui:GetChild("SignList")
  uis.State = GetActivityCasketHome_StateUis(ui:GetChild("State"))
  uis.Time = GetActivityCasketHome_TimeUis(ui:GetChild("Time"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
