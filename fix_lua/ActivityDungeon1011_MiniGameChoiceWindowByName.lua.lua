require("ActivityDungeon1011_MiniGameChoiceByName")

function GetActivityDungeon1011_MiniGameChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniGameChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
