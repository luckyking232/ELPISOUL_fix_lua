require("ActivityDungeon1008_MiniStart_ItemByName")

function GetActivityDungeon1008_MiniStart_EffectTipsUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1008_MiniStart_ItemUis(ui:GetChild("Item"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
