require("CommonResource_BackGroundByName")
require("ActivityDungeon1019_MiniStart_OperateRegionByName")
require("ActivityDungeon1019_MiniStart_IntegralByName")
require("ActivityDungeon1019_MiniStart_HpByName")
require("ActivityDungeon1019_MiniStart_OperateTipsByName")
require("ActivityDungeon1019_MiniStart_WordTipsByName")

function GetActivityDungeon1019_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1019_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1019_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Hp = GetActivityDungeon1019_MiniStart_HpUis(ui:GetChild("Hp"))
  uis.OperateTips = GetActivityDungeon1019_MiniStart_OperateTipsUis(ui:GetChild("OperateTips"))
  uis.WordTips = GetActivityDungeon1019_MiniStart_WordTipsUis(ui:GetChild("WordTips"))
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
