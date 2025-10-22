require("ActivityDungeon1015_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1015_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
