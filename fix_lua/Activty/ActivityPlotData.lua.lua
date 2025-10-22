ActivityPlotData = {}
local info

function ActivityPlotData.SaveActivityData(msg)
  info = msg
end

function ActivityPlotData.GetActivityInfo()
  return info
end

function ActivityPlotData.UpdateLockList(unlockList)
  if unlockList then
    info.unlockList = unlockList
  end
end

function ActivityPlotData.UpdateShop(boughtItem)
  if boughtItem then
    info.boughtItem = boughtItem
  end
end
