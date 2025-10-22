require("ActivityDungeon1021_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1021_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
