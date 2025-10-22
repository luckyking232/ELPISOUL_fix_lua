require("ActivityDungeon1004_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1004_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
