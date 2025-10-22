require("CommonResource_BackGroundByName")
require("ActivityDungeon1022_MiniStart_OperateRegion4ByName")
require("ActivityDungeon1022_MiniStart_OperateRegion5ByName")
require("ActivityDungeon1022_MiniStart_OperateRegion6ByName")
require("ActivityDungeon1022_MiniStart_OperateRegion7ByName")
require("ActivityDungeon1022_MiniStart_WordByName")

function GetActivityDungeon1022_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion4 = GetActivityDungeon1022_MiniStart_OperateRegion4Uis(ui:GetChild("OperateRegion4"))
  uis.OperateRegion5 = GetActivityDungeon1022_MiniStart_OperateRegion5Uis(ui:GetChild("OperateRegion5"))
  uis.OperateRegion6 = GetActivityDungeon1022_MiniStart_OperateRegion6Uis(ui:GetChild("OperateRegion6"))
  uis.OperateRegion7 = GetActivityDungeon1022_MiniStart_OperateRegion7Uis(ui:GetChild("OperateRegion7"))
  uis.ResetBtn = ui:GetChild("ResetBtn")
  uis.RevokeBtn = ui:GetChild("RevokeBtn")
  uis.Word = GetActivityDungeon1022_MiniStart_WordUis(ui:GetChild("Word"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
