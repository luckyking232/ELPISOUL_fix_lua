require("ActivityDungeon1017Battle_NormalHitNumberByName")

function GetActivityDungeon1017Battle_NormalHitNumberTipsUis(ui)
  local uis = {}
  uis.NormalHitNumber = GetActivityDungeon1017Battle_NormalHitNumberUis(ui:GetChild("NormalHitNumber"))
  uis.root = ui
  return uis
end
