require("ActivityDungeon1005_MiniGameChoiceByName")

function GetActivityDungeon1005_MiniGameChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniGameChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
