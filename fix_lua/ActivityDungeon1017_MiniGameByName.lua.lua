require("CommonResource_BackGroundByName")
require("ActivityDungeon1017_MiniMain_TopByName")
require("ActivityDungeon1017_MiniMain_BottonByName")

function GetActivityDungeon1017_MiniGameUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Top = GetActivityDungeon1017_MiniMain_TopUis(ui:GetChild("Top"))
  uis.Botton = GetActivityDungeon1017_MiniMain_BottonUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.SetBtn = ui:GetChild("SetBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.root = ui
  return uis
end
