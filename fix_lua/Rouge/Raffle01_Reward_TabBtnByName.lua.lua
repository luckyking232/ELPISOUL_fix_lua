require("Raffle01_Reward_NowByName")
require("Raffle01_Reward_TimeLockByName")

function GetRaffle01_Reward_TabBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Now = GetRaffle01_Reward_NowUis(ui:GetChild("Now"))
  uis.Lcok = GetRaffle01_Reward_TimeLockUis(ui:GetChild("Lcok"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
