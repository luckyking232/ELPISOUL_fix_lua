require("ActivityDungeon1008_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1008_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
