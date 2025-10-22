require("CommonResource_BackGroundByName")
require("ActivityDungeon1013_MainTitleByName")
require("ActivityDungeon1013_ReviewWordByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1013_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainTitle = GetActivityDungeon1013_MainTitleUis(ui:GetChild("MainTitle"))
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
  uis.ReviewWord = GetActivityDungeon1013_ReviewWordUis(ui:GetChild("ReviewWord"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.reviewCtr = ui:GetController("review")
  uis.root = ui
  return uis
end
