require("ActivityDungeon1022_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1022_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
