require("CommonResource_BackGroundByName")
require("ActivityDungeon1004_MainTitleByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1004_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainTitle = GetActivityDungeon1004_MainTitleUis(ui:GetChild("MainTitle"))
  uis.MiniGame1Btn = ui:GetChild("MiniGame1Btn")
  uis.MiniGameBtn = ui:GetChild("MiniGameBtn")
  uis.SignBtn = ui:GetChild("SignBtn")
  uis.PassBtn = ui:GetChild("PassBtn")
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.NormalBtn = ui:GetChild("NormalBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.MaterialBtn = ui:GetChild("MaterialBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
