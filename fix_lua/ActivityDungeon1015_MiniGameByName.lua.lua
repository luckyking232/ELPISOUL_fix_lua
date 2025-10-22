require("CommonResource_BackGroundByName")
require("ActivityDungeon1015_MiniMain_TopByName")
require("ActivityDungeon1015_MiniMain_BottonByName")

function GetActivityDungeon1015_MiniGameUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Top = GetActivityDungeon1015_MiniMain_TopUis(ui:GetChild("Top"))
  uis.Botton = GetActivityDungeon1015_MiniMain_BottonUis(ui:GetChild("Botton"))
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.OperateBtn = ui:GetChild("OperateBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
