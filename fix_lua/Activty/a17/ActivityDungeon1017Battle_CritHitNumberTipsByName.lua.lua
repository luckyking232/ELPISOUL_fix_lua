require("ActivityDungeon1017Battle_CritHitNumberByName")

function GetActivityDungeon1017Battle_CritHitNumberTipsUis(ui)
  local uis = {}
  uis.CritHitNumber = GetActivityDungeon1017Battle_CritHitNumberUis(ui:GetChild("CritHitNumber"))
  uis.root = ui
  return uis
end
