require("ActivityDungeon1003_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1003_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
