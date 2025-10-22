require("ExploreDungeon_LevelUp_TipsRoundByName")
require("ExploreDungeon_LevelUp_NewByName")
require("ExploreDungeon_LevelUp_TitleLockByName")

function GetExploreDungeon_LevelUp_TipsBtnUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.TipsRound = GetExploreDungeon_LevelUp_TipsRoundUis(ui:GetChild("TipsRound"))
  uis.New = GetExploreDungeon_LevelUp_NewUis(ui:GetChild("New"))
  uis.Lock = GetExploreDungeon_LevelUp_TitleLockUis(ui:GetChild("Lock"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
