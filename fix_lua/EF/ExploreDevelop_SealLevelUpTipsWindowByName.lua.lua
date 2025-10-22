require("ExploreDevelop_SealLevel_UpUpTipsByName")

function GetExploreDevelop_SealLevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDevelop_SealLevel_UpUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
