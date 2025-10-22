require("ActivityDungeon1017Battle_GreenHpNumberByName")

function GetActivityDungeon1017Battle_GreenHpNumberTipsUis(ui)
  local uis = {}
  uis.GreenHpNumber = GetActivityDungeon1017Battle_GreenHpNumberUis(ui:GetChild("GreenHpNumber"))
  uis.root = ui
  return uis
end
