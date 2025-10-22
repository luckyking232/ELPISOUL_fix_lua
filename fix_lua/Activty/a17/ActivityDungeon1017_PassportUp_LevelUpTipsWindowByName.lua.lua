require("ActivityDungeon1017_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1017_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
