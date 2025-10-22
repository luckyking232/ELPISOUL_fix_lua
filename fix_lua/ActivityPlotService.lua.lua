ActivityPlotService = {}

function ActivityPlotService.Init()
  Net.AddListener(Proto.MsgName.GetActivityReviewInfoRsp, ActivityPlotService.GetActivityReviewInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityReviewShopBuyRsp, ActivityPlotService.ActivityReviewShopBuyRsp)
  Net.AddListener(Proto.MsgName.ActivityReviewUnlockRsp, ActivityPlotService.ActivityReviewUnlockRsp)
end

function ActivityPlotService.GetActivityReviewInfoReq(rspCallBack)
  local msg = {}
  Net.Send(Proto.MsgName.GetActivityReviewInfoReq, msg, rspCallBack)
end

function ActivityPlotService.GetActivityReviewInfoRsp(msg)
  ActivityPlotData.SaveActivityData(msg)
end

function ActivityPlotService.ActivityReviewUnlockReq(actId, rspCallBack)
  local msg = {}
  msg.actId = actId
  Net.Send(Proto.MsgName.ActivityReviewUnlockReq, msg, rspCallBack)
end

function ActivityPlotService.ActivityReviewUnlockRsp(msg)
  ActivityPlotData.UpdateLockList(msg.unlockList)
end

function ActivityPlotService.ActivityReviewShopBuyReq(buyCount, gridId, rspCallBack)
  local msg = {}
  msg.buyCount = buyCount
  msg.gridId = gridId
  Net.Send(Proto.MsgName.ActivityReviewShopBuyReq, msg, rspCallBack)
end

function ActivityPlotService.ActivityReviewShopBuyRsp(msg)
  ActivityPlotData.UpdateShop(msg.boughtItem)
  UIMgr:SendWindowMessage(WinResConfig.ActivityPlotShopWindow.name, WindowMsgEnum.ActivityPlot.REFRESH_SHOP)
  GetItemTips.Show(msg.rewards)
end

ActivityPlotService.Init()
