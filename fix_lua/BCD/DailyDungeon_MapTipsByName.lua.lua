function GetDailyDungeon_MapTipsUis(ui)
  local uis = {}
  
  uis.MapTipsBtn = ui:GetChild("MapTipsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
