function GetHome_AssetsTipsGroupUis(ui)
  local uis = {}
  
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.RankBtn = ui:GetChild("RankBtn")
  uis.BagBtn = ui:GetChild("BagBtn")
  uis.MailBtn = ui:GetChild("MailBtn")
  uis.NoticeBtn = ui:GetChild("NoticeBtn")
  uis.ChatBtn = ui:GetChild("ChatBtn")
  uis.TotalBtn = ui:GetChild("TotalBtn")
  uis.root = ui
  return uis
end
