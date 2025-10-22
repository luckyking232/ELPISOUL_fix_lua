require("ActivityDungeon1016_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1016_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
