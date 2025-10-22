require("CommonResource_ItemFrameByName")

function GetExploreDungeon_LevelExplain_InfoUis(ui)
  local uis = {}
  uis.n2 = GetCommonResource_ItemFrameUis(ui:GetChild("n2"))
  uis.NowTxt = ui:GetChild("NowTxt")
  uis.AfterTxt = ui:GetChild("AfterTxt")
  uis.root = ui
  return uis
end
