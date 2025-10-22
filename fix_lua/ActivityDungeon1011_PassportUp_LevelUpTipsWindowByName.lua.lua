require("ActivityDungeon1011_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1011_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
