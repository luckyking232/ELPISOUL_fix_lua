require("ActivityCasket01_CasketWindowByName")
local ActivityCasket2Window = {}
local uis, contentPane, turnTableInfo, turnTableConfig, boxObj, tempHolder, boxUnlockNum, showBoxOpen, maxNum, curIndex, lastIndex, isActivityEnd, animPlay, mapCom
local tatalNum = 1
local speedUpNum = 0
local time = 0.015
local speedUp = 0.005
local waitTime = 0.8

function ActivityCasket2Window.ReInitData()
end

function ActivityCasket2Window.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityCasket2Window.package, WinResConfig.ActivityCasket2Window.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityCasket01_CasketWindowUis(contentPane)
    local activityId = bridgeObj.argTable[1]
    turnTableInfo = SignData.GetTurnActData(activityId)
    if turnTableInfo then
      local activityConfig = TableData.GetConfig(turnTableInfo.baseInfo.activityId, "BaseActivity")
      if activityConfig then
        turnTableConfig = TableData.GetConfig(tonumber(activityConfig.parameter), "BaseActivityTurntable")
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(turnTableConfig.bg_path)
      end
      showBoxOpen = nil
      ActivityCasket2Window.UpdateInfo()
      ActivityCasket2Window.InitBtn()
    end
  end)
end

function ActivityCasket2Window.GetPoolInfo(pools, id)
  if id and pools then
    for i, v in pairs(pools) do
      if v.poolId == id then
        return v
      end
    end
  end
end

local allData

function ActivityCasket2Window.UpdateInfo(poolId)
  ActivityCasket2Window.InitAssetsTips()
  ChangeUIController(uis.Main.ShopBtn, "c1", 0 == turnTableInfo.freeGet and turnTableConfig.pay_free_reward and 1 or 0)
  UIUtil.SetText(uis.Main.GaChaBtn, T(1826), "Word3Txt")
  UIUtil.SetText(uis.Main.GaChaBtn, T(1829), "Word2Txt")
  local number = 0
  if turnTableConfig then
    if nil == mapCom then
      mapCom = UIMgr:CreateObject("ActivityCasket01", "TagRegion_01")
      uis.Main.TagRegion.root:AddChild(mapCom)
    end
    allData = ActivityCasket2Window.GetData(turnTableConfig.group_id)
    maxNum = #allData
    for i = 1, maxNum do
      local tips = mapCom:GetChild("Tag" .. i)
      local arr = GetConfigItemList(allData[i].reward, true)
      local poolInfo = ActivityCasket2Window.GetPoolInfo(turnTableInfo.pools, allData[i].id)
      if tips and arr[1] then
        if poolId and poolInfo and poolInfo.poolId == poolId then
          tempHolder = tips:GetChild("EffectHolder")
          if arr[1].type == ProtoEnum.TUPLE_TYPE.T_FASHION then
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_act9_rotary_reward_box")
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/turntable/FX_ui_turntable_zhounian1_midlight_open_get.prefab", tempHolder, nil, true)
          else
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_act9_rotary_reward_single")
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/turntable/FX_ui_turntable_midlight_get.prefab", tempHolder, nil, true)
          end
        end
        local itemData = TableData.GetConfigByType(arr[1].type, arr[1].id)
        if itemData and itemData.name then
          UIUtil.SetMoveText(tips:GetChild("MoveWord"), itemData.name())
        end
        tips.onClick:Set(function()
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
        if poolInfo then
          if poolInfo.count > 0 then
            ChangeUIController(tips, "c2", 1)
            UIUtil.SetText(tips, T(1828, poolInfo.prob / 100), "WordTxt")
          else
            ChangeUIController(tips, "c2", 2)
            UIUtil.SetText(tips, T(949), "WordTxt")
            number = number + 1
          end
        else
          UIUtil.SetText(tips, T(1835, allData[i].unlock_num - turnTableInfo.turnNum), "WordTxt")
          ChangeUIController(tips, "c2", 0)
        end
        if arr[1].type == ProtoEnum.TUPLE_TYPE.T_FASHION then
          boxUnlockNum = allData[i].unlock_num
          if nil == boxObj then
            boxObj = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/ui_Turntable_skin_gift_bh.prefab", tips:GetChild("BoxHolder"))
          end
          if showBoxOpen and nil == poolId then
            SkeletonAnimationUtil.SetAnimation(boxObj, 0, "open", false, 0, function()
              SkeletonAnimationUtil.SetAnimation(boxObj, 0, "open_idle", true, 0, function()
              end)
            end)
          else
            local name = "close_idle"
            if turnTableInfo.turnNum > boxUnlockNum or turnTableInfo.turnNum == boxUnlockNum and nil == poolId then
              name = "open_idle"
            end
            SkeletonAnimationUtil.SetAnimation(boxObj, 0, name, true, 0, function()
            end)
          end
        end
      end
    end
  end
  UIUtil.SetText(uis.Main.GaChaBtn, T(1878, number), "ProgressTxt")
  local canDo = false
  local tempId
  if maxNum and turnTableInfo and turnTableInfo.turnNum and turnTableInfo.turnNum >= maxNum then
    ChangeUIController(uis.Main.GaChaBtn, "c1", 1)
    uis.Main.GaChaBtn.touchable = false
  else
    uis.Main.GaChaBtn.touchable = true
    ChangeUIController(uis.Main.GaChaBtn, "c1", 0)
    local cost = ActivityCasket2Window.GetCost()
    if cost and cost[1] then
      local id = turnTableConfig.cost_change
      if ActorData.GetItemCount(cost[1].id) >= cost[1].value then
        local spend1 = uis.Main.GaChaBtn:GetChild("Spend1")
        if spend1 then
          UIUtil.SetIconById(spend1:GetChild("ItemLoader"), cost[1].id)
          UIUtil.SetText(spend1, cost[1].value, "SpendTxt")
        end
        ChangeUIController(uis.Main.GaChaBtn, "c2", 1)
        canDo = true
      else
        local have = ActorData.GetItemCount(cost[1].id)
        if ActorData.GetItemCount(id) > 0 and have > 0 then
          local temp = cost[1].value - have
          local spend1 = uis.Main.GaChaBtn:GetChild("Spend1")
          if spend1 then
            UIUtil.SetIconById(spend1:GetChild("ItemLoader"), cost[1].id)
            UIUtil.SetText(spend1, have, "SpendTxt")
          end
          local spend2 = uis.Main.GaChaBtn:GetChild("Spend2")
          if spend2 then
            UIUtil.SetIconById(spend2:GetChild("ItemLoader"), id)
            UIUtil.SetText(spend2, temp, "SpendTxt")
          end
          if temp <= ActorData.GetItemCount(id) then
            canDo = true
          else
            tempId = id
          end
          ChangeUIController(uis.Main.GaChaBtn, "c2", 2)
        else
          if ActorData.GetItemCount(id) > 0 then
            tempId = id
          elseif cost[1].id > 0 then
            tempId = cost[1].id
          end
          local spend1 = uis.Main.GaChaBtn:GetChild("Spend1")
          if spend1 then
            UIUtil.SetIconById(spend1:GetChild("ItemLoader"), tempId)
            UIUtil.SetText(spend1, cost[1].value, "SpendTxt")
          end
          if ActorData.GetItemCount(tempId) >= cost[1].value then
            canDo = true
          end
          ChangeUIController(uis.Main.GaChaBtn, "c2", 1)
        end
      end
    else
      ChangeUIController(uis.Main.GaChaBtn, "c2", 0)
      UIUtil.SetText(uis.Main.GaChaBtn, T(1829), "Word2Txt")
      canDo = true
    end
    UIUtil.SetText(uis.Main.GaChaBtn, T(1825), "Word1Txt")
    uis.Main.GaChaBtn.onClick:Set(function()
      if maxNum and turnTableInfo and turnTableInfo.turnNum and turnTableInfo.turnNum >= maxNum then
        return
      end
      if canDo then
        local tempPools = SimpleCopy(turnTableInfo.pools)
        SignService.ActivityDoTurnTableReq(turnTableInfo.baseInfo.activityId, function(msg)
          for i, v in pairs(SignData.turnAct) do
            if v.baseInfo.activityId == turnTableInfo.baseInfo.activityId then
              SignData.turnAct[i].turnNum = msg.turnNum
              SignData.turnAct[i].pools = msg.pools
            end
          end
          uis.Main.GaChaBtn.touchable = false
          curIndex = 0
          lastIndex = 0
          time = 0.1
          uis.Main.root.touchable = false
          animPlay = true
          ActivityCasket2Window.PlanAnim(tempPools, msg.poolId, function()
            if uis then
              uis.Main.GaChaBtn.touchable = true
              ActivityCasket2Window.UpdateInfo(msg.poolId)
              showBoxOpen = msg.turnNum == boxUnlockNum
              LeanTween.delayedCall(1, function()
                if uis then
                  animPlay = nil
                  GetItemTips.Show(msg.rewards)
                  uis.Main.root.touchable = true
                  if tempHolder then
                    tempHolder:SetNativeObject(nil)
                    tempHolder = nil
                  end
                  if isActivityEnd then
                    ActivityCasket2Window.CheckActivityEnd()
                  end
                end
              end)
            end
            RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
          end)
        end)
      else
        local itemData = TableData.GetConfig(tempId, "BaseItem")
        if itemData then
          FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
        end
      end
    end)
  end
end

function ActivityCasket2Window.PlanAnim(tempPools, poolId, callback)
  curIndex = curIndex + 1
  local indexTb = {}
  local tempInd
  for i = 1, #allData do
    local poolInfo = ActivityCasket2Window.GetPoolInfo(tempPools, allData[i].id)
    if poolInfo and poolId == poolInfo.poolId then
      tempInd = i
    end
    if poolInfo and poolInfo.count > 0 then
      table.insert(indexTb, i)
    end
  end
  local len = #indexTb
  if len < 2 then
    callback()
    return
  end
  local newTb = table.randomSort(indexTb)
  if curIndex > tatalNum and tempInd then
    table.insert(newTb, tempInd)
    print(tempInd, ">>>>>>>>>>>tempInd>>>>>>>>>>")
  end
  for i = 1, len do
    if curIndex > speedUpNum then
      time = time + speedUp
    end
    TimerUtil.setTimeout(i * time, function()
      if uis then
        local tips = mapCom:GetChild("Tag" .. newTb[i])
        if 10 == newTb[i] then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_act9_rotary_reward_box")
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/turntable/FX_ui_turntable1_midlight_open.prefab", tips:GetChild("EffectHolder"), nil, true)
        else
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_act9_rotary_roll")
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/turntable/FX_ui_turntable_light.prefab", tips:GetChild("EffectHolder"), nil, true)
        end
        if i == len then
          if curIndex <= tatalNum then
            LeanTween.delayedCall(time, function()
              ActivityCasket2Window.PlanAnim(tempPools, poolId, callback)
            end)
          elseif callback then
            LeanTween.delayedCall(waitTime, function()
              callback()
            end)
          end
        end
      end
    end)
  end
end

function ActivityCasket2Window.GetData(groupId)
  local config = TableData.GetTable("BaseActivityTurntablePool")
  local tb = {}
  for i, v in pairs(config) do
    if v.group_id == groupId then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.sort < b.sort
  end)
  return tb
end

function ActivityCasket2Window.GetCost()
  local config = TableData.GetTable("BaseBuyTime")
  local tb = {}
  for i, v in pairs(config) do
    if v.type == turnTableConfig.cost_type then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  local curNum = turnTableInfo and turnTableInfo.turnNum + 1 or 1
  for i = 1, #tb do
    if curNum >= tb[i].start and curNum <= tb[i].finish and tb[i].cost then
      return GetConfigItemList(tb[i].cost, true)
    end
  end
end

function ActivityCasket2Window.InitAssetsTips()
  local assetlist = turnTableConfig.title_show
  
  function uis.Main.AssetsTipsList.itemRenderer(i, item)
    local itemId = assetlist[i + 1]
    ChangeUIController(item, "c1", 0)
    item:GetChild("AssetsBtn").onClick:Set(function()
      uis.Main.AssetsTipsList.onClick:Set(function()
        OpenWindow(WinResConfig.ActivityCasket2ExplainTipsWindow.name, nil, 0, turnTableConfig, turnTableInfo.baseInfo.activityId)
      end)
    end)
    local count = ActorData.GetItemCount(itemId)
    UIUtil.SetIconById(item:GetChild("IconLoader"), itemId, true)
    UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
  end
  
  uis.Main.AssetsTipsList.numItems = #assetlist
end

function ActivityCasket2Window.InitBtn()
  local btnTb = {
    [1] = {
      btn = uis.Main.ShopBtn,
      txt = T(1822),
      ctr = 0
    },
    [2] = {
      btn = uis.Main.RuleBtn,
      txt = T(1823),
      ctr = 1
    },
    [3] = {
      btn = uis.Main.RecordBtn,
      txt = T(1824),
      ctr = 2
    }
  }
  for i = 1, #btnTb do
    UIUtil.SetText(btnTb[i].btn, btnTb[i].txt)
    btnTb[i].btn.onClick:Set(function()
      OpenWindow(WinResConfig.ActivityCasket2ExplainTipsWindow.name, nil, btnTb[i].ctr, turnTableConfig, turnTableInfo.baseInfo.activityId)
    end)
  end
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityCasket2Window.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(1877), "TagTxt")
end

function ActivityCasket2Window.OnShown()
  if uis then
    ActivityCasket2Window.UpdateInfo()
    showBoxOpen = nil
  end
end

function ActivityCasket2Window.OnClose()
  uis = nil
  contentPane = nil
  turnTableConfig = nil
  turnTableInfo = nil
  boxObj = nil
  mapCom = nil
  maxNum = nil
  curIndex = nil
  lastIndex = nil
  tempHolder = nil
  allData = nil
  isActivityEnd = nil
  animPlay = nil
end

function ActivityCasket2Window.CheckActivityEnd()
  if nil == turnTableInfo or turnTableInfo and LoginData.GetCurServerTime() >= turnTableInfo.baseInfo.endStamp then
    if animPlay then
      isActivityEnd = true
      return
    end
    LeanTween.delayedCall(0.15, function()
      MessageBox.Show(T(1618), {
        touchCallback = function()
          UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
        end
      }, nil, {touchable = false})
    end)
  end
end

function ActivityCasket2Window.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityCasket2Window.CheckActivityEnd()
  end
end

return ActivityCasket2Window
