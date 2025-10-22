require("ActivityDungeon1007_SignWindowByName")
local Activity8SignWindow = {}
local uis, contentPane, activityInfo

function Activity8SignWindow.ReInitData()
end

function Activity8SignWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8SignWindow.package, WinResConfig.Activity8SignWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_SignWindowUis(contentPane)
    Activity8SignWindow.UpdateInfo()
    Activity8SignWindow.InitBtn()
  end)
end

function Activity8SignWindow.UpdateInfo(notPlayAnim)
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    uis.Main.Time.WordTxt.text = T(1527)
    uis.Main.Time.TimeTxt.text = TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime())
    local data = ActivityDungeonData.GetActivityData()
    if data then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_check_in)
      local list = uis.Main.RewardList
      local signData = Activity8SignWindow.GetRewardData(data.check_in_id)
      local toIndex
      
      function list.RewardList.itemRenderer(i, item)
        local rewardItem = item:GetChild("Reward")
        local day = LuaUtil.FormatNum(signData[i + 1].day, "00")
        UIUtil.SetText(rewardItem, day, "NumberTxt")
        UIUtil.SetText(rewardItem, day, "Number1Txt")
        rewardItem.onClick:Clear()
        local showTips = true
        if signData[i + 1].day <= activityInfo.curDay then
          if table.contain(activityInfo.signDay, signData[i + 1].day) then
            ChangeUIController(rewardItem, "c1", 2)
          else
            showTips = false
            ChangeUIController(rewardItem, "c1", 1)
            rewardItem.onClick:Set(function()
              ActivityDungeonService.ActivityStageSignInReq(signData[i + 1].day, activityInfo.baseInfo.activityId, function()
                if uis then
                  Activity8SignWindow.UpdateInfo(true)
                end
              end)
            end)
            toIndex = i
          end
        else
          ChangeUIController(rewardItem, "c1", 0)
        end
        local arr = GetConfigItemList(signData[i + 1].reward, true)
        if arr[1] then
          Activity8SignWindow.ShowAllItemFrame(arr[1], rewardItem:GetChild("Item"), function()
            if showTips then
              UIUtil.OpenPreviewTips(arr[1].id, arr[1].type)
            end
          end)
        end
        if not notPlayAnim then
          rewardItem.alpha = 0
          PlayUITrans(item, "up", nil, i * 0.05)
          TimerUtil.setTimeout(i * 0.05, function()
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
          end)
        end
      end
      
      list.RewardList.numItems = #signData
      if toIndex then
        list.RewardList:ScrollToView(toIndex)
      end
    end
    UIUtil.SetText(uis.Main.GetBtn, T(1528))
    uis.Main.GetBtn.onClick:Set(function()
      ActivityDungeonService.ActivityStageSignInReq(0, activityInfo.baseInfo.activityId, function()
        if uis then
          Activity8SignWindow.UpdateInfo(true)
        end
      end)
    end)
    uis.Main.GetBtn.visible = RedDotActivityDungeon.CanSgin() and true or false
  end
end

function Activity8SignWindow.ShowAllItemFrame(addAttr, item, callBack)
  if addAttr.type == ProtoEnum.TUPLE_TYPE.CARD then
    local loader = item:GetChild("CardFrame"):GetChild("ItemCardPic"):GetChild("ItemLoader")
    if loader then
      local data = TableData.GetConfig(addAttr.id, "BaseCard")
      if data then
        UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
        ChangeUIController(item:GetChild("CardFrame"), "c1", data.star - 1)
      end
    end
    ChangeUIController(item, "c2", 1)
  elseif addAttr.type == ProtoEnum.TUPLE_TYPE.ITEM then
    local config = TableData.GetConfig(addAttr.id, "BaseItem")
    local itemFrame = item:GetChild("ItemFrame")
    local loader = itemFrame:GetChild("ItemLoader")
    if loader and config then
      loader.url = UIUtil.GetResUrl(config.icon)
    end
    ChangeUIController(item, "c2", 0)
    ChangeUIController(itemFrame, "c1", config.quality)
    local numberTxt = itemFrame:GetChild("NumberTxt")
    if numberTxt then
      numberTxt.text = addAttr.value
    end
  end
  item.onClick:Set(callBack)
end

function Activity8SignWindow.GetRewardData(groupId)
  local data = TableData.GetTable("BaseActivityCheckIn")
  local newTb = {}
  for i, v in pairs(data) do
    if v.type == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.day < b.day
  end)
  return newTb
end

function Activity8SignWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity8SignWindow.CloseWindow)
end

function Activity8SignWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity8SignWindow.name)
end

function Activity8SignWindow.OnClose()
  uis = nil
  contentPane = nil
  activityInfo = nil
end

return Activity8SignWindow
