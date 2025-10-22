require("ActivityCasket_ExplainTipsWindowByName")
local ActivityCasketExplainTipsWindow = {}
local uis, contentPane, turnTableConfig, turnTableInfo

function ActivityCasketExplainTipsWindow.ReInitData()
end

function ActivityCasketExplainTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityCasketExplainTipsWindow.package, WinResConfig.ActivityCasketExplainTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityCasket_ExplainTipsWindowUis(contentPane)
    local ctr = bridgeObj.argTable[1]
    turnTableConfig = bridgeObj.argTable[2]
    local activityId = bridgeObj.argTable[3]
    turnTableInfo = SignData.GetTurnActData(activityId)
    ActivityCasketExplainTipsWindow.UpdateInfo()
    uis.Main.ExplainTips.c1Ctr.selectedIndex = ctr
    ActivityCasketExplainTipsWindow.InitBtn()
  end)
end

function ActivityCasketExplainTipsWindow.UpdateInfo()
  ActivityCasketExplainTipsWindow.ShowShop()
  ActivityCasketExplainTipsWindow.ShowRule()
  ActivityCasketExplainTipsWindow.ShowRecord()
end

function ActivityCasketExplainTipsWindow.ShowShop()
  if nil == turnTableInfo then
    return
  end
  local tips = uis.Main.ExplainTips.ExplainTips1
  tips.TitleTxt.text = T(1822)
  local numMax = turnTableConfig.pay_free_reward and #turnTableConfig.pay_id + 1 or #turnTableConfig.pay_id
  
  function tips.ContentList.itemRenderer(index, item)
    local arr
    if 0 == index and turnTableConfig.pay_free_reward then
      UIUtil.SetText(item, T(1829), "PriceTxt")
      UIUtil.SetText(item, T(1832, 0 == turnTableInfo.freeGet and 1 or 0), "BuyNumberTxt")
      arr = GetConfigItemList(turnTableConfig.pay_free_reward, true)
      item.onClick:Set(function()
        if 0 == turnTableInfo.freeGet then
          SignService.ActivityTurnTableGetFreeReq(turnTableInfo.baseInfo.activityId, function()
            for i, v in pairs(SignData.turnAct) do
              if v.baseInfo.activityId == turnTableInfo.baseInfo.activityId then
                SignData.turnAct[i].freeGet = 1
              end
            end
            if uis then
              ChangeUIController(item, "c1", 1)
              UIUtil.SetText(item, T(1832, 0), "BuyNumberTxt")
            end
          end)
        end
      end)
      ChangeUIController(item, "c1", 0 == turnTableInfo.freeGet and 0 or 1)
    else
      local ind = turnTableConfig.pay_free_reward and index or index + 1
      local payData = TableData.GetConfig(turnTableConfig.pay_id[ind], "BasePayProduct")
      if payData then
        UIUtil.SetText(item, T(1834, payData.price), "PriceTxt")
        arr = GetConfigItemList(payData.rewards, true)
        local curNum = ShopData.limitRecord[payData.id] and ShopData.limitRecord[payData.id] or 0
        UIUtil.SetText(item, T(1832, payData.sell_limit_max - curNum), "BuyNumberTxt")
        ChangeUIController(item, "c1", curNum >= payData.sell_limit_max and 1 or 0)
        item.onClick:Set(function()
          if nil == turnTableInfo or turnTableInfo and LoginData.GetCurServerTime() >= turnTableInfo.baseInfo.endStamp then
            FloatTipsUtil.ShowWarnTips(T(1618))
            return
          end
          if curNum < payData.sell_limit_max then
            ShopMgr.BuyProduct(payData.id)
          end
        end)
      end
    end
    if arr and arr[1] then
      UIUtil.SetIconById(item:GetChild("PicLoader"), arr[1].id)
      UIUtil.SetText(item, arr[1].value, "GroupNumberTxt")
    end
    UIUtil.SetText(item, T(1833), "WordTxt")
  end
  
  tips.ContentList.numItems = numMax
end

function ActivityCasketExplainTipsWindow.ShowRule()
  local tips = uis.Main.ExplainTips.ExplainTips2
  tips.TitleTxt.text = T(1823)
  local data = TableData.GetConfig(FEATURE_ENUM.ACIVITY_TURNTABLE, "BaseFeature")
  
  function tips.ContentList.itemRenderer(i, item)
    UIUtil.SetText(item, T(data.rule_des[1]), "WordTxt")
    local wordList = item:GetChild("WordList")
    
    function wordList.itemRenderer(index, word)
      UIUtil.SetText(word, T(data.rule_des[index + 2]), "WordTxt")
    end
    
    wordList.numItems = #data.rule_des - 1
    wordList:ResizeToFit()
  end
  
  tips.ContentList.numItems = 1
end

function ActivityCasketExplainTipsWindow.ShowRecord()
  local tips = uis.Main.ExplainTips.ExplainTips3
  tips.TitleTxt.text = T(1824)
  local turnNum = turnTableInfo and turnTableInfo.turnNum or 0
  local data = ActivityCasketExplainTipsWindow.GetCost(turnTableConfig.group_id)
  
  function tips.ContentList.itemRenderer(i, item)
    if data[i + 1].reward then
      local arr = GetConfigItemList(data[i + 1].reward, true)
      if arr[1] then
        if data[i + 1].rank_name then
          UIUtil.SetText(item, data[i + 1].rank_name(), "RewardTxt")
        end
        local poolInfo = ActivityCasketExplainTipsWindow.GetPoolInfo(turnTableInfo.pools, data[i + 1].id)
        if poolInfo then
          if poolInfo.count > 0 then
            ChangeUIController(item, "c1", 1)
            UIUtil.SetText(item, T(1828, poolInfo.prob / 100), "WordTxt")
          else
            ChangeUIController(item, "c1", 2)
            UIUtil.SetText(item, T(949), "WordTxt")
          end
        else
          UIUtil.SetText(item, T(1835, data[i + 1].unlock_num - turnTableInfo.turnNum), "WordTxt")
          ChangeUIController(item, "c1", 0)
        end
        local conf = TableData.GetConfigByType(arr[1].type, arr[1].id)
        if conf and conf.name then
          UIUtil.SetText(item, conf.name(), "NameTxt")
        end
        UIUtil.ShowItemFrame(arr[1].id, item:GetChild("Item"), arr[1].value, nil, function()
          if arr[1].type == ProtoEnum.TUPLE_TYPE.T_FASHION then
            OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
              {
                id = arr[1].id
              }
            })
          else
            UIUtil.OpenPreviewTips(arr[1].id, arr[1].type)
          end
        end)
      end
    end
  end
  
  tips.ContentList.numItems = #data
end

function ActivityCasketExplainTipsWindow.GetPoolInfo(pools, id)
  if id and pools then
    for i, v in pairs(pools) do
      if v.poolId == id then
        return v
      end
    end
  end
end

function ActivityCasketExplainTipsWindow.GetCost(groupId)
  local config = TableData.GetTable("BaseActivityTurntablePool")
  local tb = {}
  for i, v in pairs(config) do
    if v.group_id == groupId then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.rank_sort < b.rank_sort
  end)
  return tb
end

function ActivityCasketExplainTipsWindow.InitBtn()
  local tips = uis.Main.ExplainTips
  local btnTb = {
    [1] = {
      btn = tips.BurstTab1Btn,
      txt = T(1822)
    },
    [2] = {
      btn = tips.BurstTab2Btn,
      txt = T(1824)
    },
    [3] = {
      btn = tips.BurstTab3Btn,
      txt = T(1823)
    }
  }
  for i = 1, #btnTb do
    UIUtil.SetText(btnTb[i].btn, btnTb[i].txt)
    btnTb[i].btn.onClick:Set(function()
    end)
  end
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityCasketExplainTipsWindow.name)
  end)
end

function ActivityCasketExplainTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  turnTableConfig = nil
  turnTableInfo = nil
end

function ActivityCasketExplainTipsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ActivityCasket.REFRESH_PAY_SHOP then
    ActivityCasketExplainTipsWindow.ShowShop()
  end
end

return ActivityCasketExplainTipsWindow
