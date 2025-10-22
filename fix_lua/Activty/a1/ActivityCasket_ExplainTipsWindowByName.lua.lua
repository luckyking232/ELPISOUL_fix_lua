require("ActivityCasket_ExplainTipsByName")

function GetActivityCasket_ExplainTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityCasket_ExplainTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
