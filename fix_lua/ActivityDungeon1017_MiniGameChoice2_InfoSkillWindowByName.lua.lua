require("ActivityDungeon1017_MiniGameChoice2_InfoSkillByName")

function GetActivityDungeon1017_MiniGameChoice2_InfoSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniGameChoice2_InfoSkillUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
