require("ActivityCasket02_ExplainTipsByName")

function GetActivityCasket02_ExplainTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket02_ExplainTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
