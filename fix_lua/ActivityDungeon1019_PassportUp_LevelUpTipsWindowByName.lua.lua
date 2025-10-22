require("ActivityDungeon1019_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1019_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
