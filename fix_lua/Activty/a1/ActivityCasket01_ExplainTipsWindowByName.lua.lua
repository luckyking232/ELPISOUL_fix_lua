require("ActivityCasket01_ExplainTipsByName")

function GetActivityCasket01_ExplainTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket01_ExplainTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
