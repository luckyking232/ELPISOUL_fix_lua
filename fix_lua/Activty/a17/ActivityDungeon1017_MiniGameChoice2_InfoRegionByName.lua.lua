require("ActivityDungeon1017_MiniGameChoice2_CardInfoLockByName")

function GetActivityDungeon1017_MiniGameChoice2_InfoRegionUis(ui)
  local uis = {}
  uis.InfoList = ui:GetChild("InfoList")
  uis.Lock = GetActivityDungeon1017_MiniGameChoice2_CardInfoLockUis(ui:GetChild("Lock"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
