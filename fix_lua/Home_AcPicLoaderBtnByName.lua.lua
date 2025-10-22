require("Home_AcLockByName")
require("CommonResource_RedDotByName")

function GetHome_AcPicLoaderBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.AcLock = GetHome_AcLockUis(ui:GetChild("AcLock"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
