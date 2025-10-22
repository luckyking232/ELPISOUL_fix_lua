require("CommonResource_BackGroundByName")
require("ActivityDungeon1018_MiniMain_TopByName")
require("ActivityDungeon1018_MiniMain_BottonByName")

function GetActivityDungeon1018_MiniGameUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Top = GetActivityDungeon1018_MiniMain_TopUis(ui:GetChild("Top"))
  uis.Botton = GetActivityDungeon1018_MiniMain_BottonUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.root = ui
  return uis
end
