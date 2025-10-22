require("ActivityDungeon1017_MiniGameChoice_LockByName")

function GetActivityDungeon1017_MiniGameChoice_Tips1BtnUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Time = GetActivityDungeon1017_MiniGameChoice_LockUis(ui:GetChild("Time"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
