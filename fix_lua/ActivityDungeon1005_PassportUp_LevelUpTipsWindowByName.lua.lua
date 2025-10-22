require("ActivityDungeon1005_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1005_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
