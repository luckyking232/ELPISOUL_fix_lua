PassportMgr = {}

function PassportMgr.OpenPassportWindow(isJump)
  if #PassportData.infoArr > 0 then
    PassportData.index = 0
    PassportData.tabIndex = 0
    PassportData.taskIndex = 0
    if isJump then
      JumpToWindow(WinResConfig.PassportWindow.name)
    else
      OpenWindow(WinResConfig.PassportWindow.name)
    end
  else
    FloatTipsUtil.ShowWarnTips(T(407))
  end
end

function PassportMgr.GetPlatformId(id, type)
  local tb = TableData.GetTable("BasePayProduct")
  for i, v in pairs(tb) do
    if (nil == type or type == v.type) and v.passport_id and v.passport_id == id then
      return v
    end
  end
end

function PassportMgr.UpdateByHomeWindow()
  if not RedDotPassport.ShowHome() then
    PassportService.GetBattlePassInfoReq()
  end
end
