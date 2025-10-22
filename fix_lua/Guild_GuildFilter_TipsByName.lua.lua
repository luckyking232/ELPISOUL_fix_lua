function GetGuild_GuildFilter_TipsUis(ui)
  local uis = {}
  
  uis.SearchList = ui:GetChild("SearchList")
  uis.SetList = ui:GetChild("SetList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.ResetBtn = ui:GetChild("ResetBtn")
  uis.SearchBtn = ui:GetChild("SearchBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
