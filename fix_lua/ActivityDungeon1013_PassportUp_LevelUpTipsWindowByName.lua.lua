require("ActivityDungeon1013_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1013_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
