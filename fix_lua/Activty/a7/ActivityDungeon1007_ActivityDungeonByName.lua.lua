require("CommonResource_BackGroundByName")
require("ActivityDungeon1007_MainTitleByName")
require("ActivityDungeon1007_ReviewWordByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1007_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainTitle = GetActivityDungeon1007_MainTitleUis(ui:GetChild("MainTitle"))
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.NormalBtn = ui:GetChild("NormalBtn")
  uis.MaterialBtn = ui:GetChild("MaterialBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.MiniGameBtn = ui:GetChild("MiniGameBtn")
  uis.SignBtn = ui:GetChild("SignBtn")
  uis.PassBtn = ui:GetChild("PassBtn")
  uis.ReviewWord = GetActivityDungeon1007_ReviewWordUis(ui:GetChild("ReviewWord"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.reviewCtr = ui:GetController("review")
  uis.root = ui
  return uis
end
