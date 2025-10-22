require("ActivityDungeon1011_MiniExplainByName")

function GetActivityDungeon1011_MiniExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
