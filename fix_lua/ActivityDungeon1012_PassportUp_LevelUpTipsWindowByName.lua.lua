require("ActivityDungeon1012_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1012_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
