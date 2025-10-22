require("CommonResource_BackGroundByName")
require("ActivityDungeon1022_MainTitleByName")
require("ActivityDungeon1022_ReviewWordByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1022_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainTitle = GetActivityDungeon1022_MainTitleUis(ui:GetChild("MainTitle"))
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.NormalBtn = ui:GetChild("NormalBtn")
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.MaterialBtn = ui:GetChild("MaterialBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.MiniGameBtn = ui:GetChild("MiniGameBtn")
  uis.SignBtn = ui:GetChild("SignBtn")
  uis.PassBtn = ui:GetChild("PassBtn")
  uis.ReviewWord = GetActivityDungeon1022_ReviewWordUis(ui:GetChild("ReviewWord"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.reviewCtr = ui:GetController("review")
  uis.root = ui
  return uis
end
