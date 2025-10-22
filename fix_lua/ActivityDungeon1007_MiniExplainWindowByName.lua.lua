require("ActivityDungeon1007_MiniExplainByName")

function GetActivityDungeon1007_MiniExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
