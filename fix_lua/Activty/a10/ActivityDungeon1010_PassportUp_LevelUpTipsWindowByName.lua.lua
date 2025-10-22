require("ActivityDungeon1010_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1010_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
