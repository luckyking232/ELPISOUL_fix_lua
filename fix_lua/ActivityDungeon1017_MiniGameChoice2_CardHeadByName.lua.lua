require("ActivityDungeon1017_MiniGameChoice2_CardHeadBgByName")

function GetActivityDungeon1017_MiniGameChoice2_CardHeadUis(ui)
  local uis = {}
  uis.Bg = GetActivityDungeon1017_MiniGameChoice2_CardHeadBgUis(ui:GetChild("Bg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
