require("CommonResource_BackGroundByName")
require("ActivityDungeon1008_MiniMain2_TopByName")
require("ActivityDungeon1008_MiniMain2_BottonByName")

function GetActivityDungeon1008_MiniGame2Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Top = GetActivityDungeon1008_MiniMain2_TopUis(ui:GetChild("Top"))
  uis.Botton = GetActivityDungeon1008_MiniMain2_BottonUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.OperateBtn = ui:GetChild("OperateBtn")
  uis.root = ui
  return uis
end
