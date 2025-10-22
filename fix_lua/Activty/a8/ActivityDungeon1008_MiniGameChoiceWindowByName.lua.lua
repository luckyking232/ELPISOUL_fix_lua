require("ActivityDungeon1008_MiniGameChoiceByName")

function GetActivityDungeon1008_MiniGameChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniGameChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
