require("Abyss_CardTitleShowByName")
require("Abyss_TalkProgressByName")
require("Abyss_TalkSummaryByName")
require("Abyss_CardPlotTalk_HideByName")

function GetAbyss_TalkTipsUis(ui)
  local uis = {}
  uis.CardTitleShow = GetAbyss_CardTitleShowUis(ui:GetChild("CardTitleShow"))
  uis.TalkProgress = GetAbyss_TalkProgressUis(ui:GetChild("TalkProgress"))
  uis.TalkSummary = GetAbyss_TalkSummaryUis(ui:GetChild("TalkSummary"))
  uis.HideWord = GetAbyss_CardPlotTalk_HideUis(ui:GetChild("HideWord"))
  uis.HideBtn = ui:GetChild("HideBtn")
  uis.NextStepBtn = ui:GetChild("NextStepBtn")
  uis.EndChoiceBtn = ui:GetChild("EndChoiceBtn")
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
