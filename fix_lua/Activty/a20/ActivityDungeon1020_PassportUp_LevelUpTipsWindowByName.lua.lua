require("ActivityDungeon1020_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1020_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
