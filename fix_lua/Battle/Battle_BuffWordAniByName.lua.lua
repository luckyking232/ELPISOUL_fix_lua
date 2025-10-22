require("Battle_BuffWordByName")

function GetBattle_BuffWordAniUis(ui)
  local uis = {}
  uis.BuffWord = GetBattle_BuffWordUis(ui:GetChild("BuffWord"))
  uis.colorCtr = ui:GetController("color")
  uis.arrowCtr = ui:GetController("arrow")
  uis.root = ui
  return uis
end
