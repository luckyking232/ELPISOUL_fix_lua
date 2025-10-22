require("ActivityDungeon1006_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1006_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
