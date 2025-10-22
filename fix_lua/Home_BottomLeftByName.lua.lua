require("Home_AcBannerByName")
require("Home_TemporaryTipsByName")

function GetHome_BottomLeftUis(ui)
  local uis = {}
  uis.ScheduleBtn = ui:GetChild("ScheduleBtn")
  uis.AcBanner = GetHome_AcBannerUis(ui:GetChild("AcBanner"))
  uis.TemporaryTips = GetHome_TemporaryTipsUis(ui:GetChild("TemporaryTips"))
  uis.ServerTxt = ui:GetChild("ServerTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.ScheduleCtr = ui:GetController("Schedule")
  uis.root = ui
  return uis
end
