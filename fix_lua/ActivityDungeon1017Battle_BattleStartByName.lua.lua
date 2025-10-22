require("ActivityDungeon1017Battle_BattleStartBgByName")

function GetActivityDungeon1017Battle_BattleStartUis(ui)
  local uis = {}
  uis.BattleStartBg = GetActivityDungeon1017Battle_BattleStartBgUis(ui:GetChild("BattleStartBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.root = ui
  return uis
end
