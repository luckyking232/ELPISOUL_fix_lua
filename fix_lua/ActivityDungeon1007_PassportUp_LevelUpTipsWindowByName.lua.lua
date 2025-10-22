require("ActivityDungeon1007_PassportUp_LevelUpTipsByName")

function GetActivityDungeon1007_PassportUp_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_PassportUp_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
