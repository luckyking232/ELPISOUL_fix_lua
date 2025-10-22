require("ActivityDungeon1014_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1014_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
