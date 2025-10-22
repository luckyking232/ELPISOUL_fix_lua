require("ActivityDungeon1008_MiniOperateChoiceByName")

function GetActivityDungeon1008_MiniOperateChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniOperateChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
