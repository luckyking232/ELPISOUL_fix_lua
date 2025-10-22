require("ActivityDungeon1010_MiniExplainByName")

function GetActivityDungeon1010_MiniExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
