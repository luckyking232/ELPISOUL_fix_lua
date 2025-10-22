require("ActivityDungeon1018_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1018_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
