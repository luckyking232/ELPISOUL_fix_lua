require("ExploreSign01_ExploreSignWindowByName")
local ExploreSign1Window = {}
local uis, contentPane, data, activityData, signIndex, isAct, pos, showIndex

function ExploreSign1Window.ReInitData()
end

function ExploreSign1Window.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreSign1Window.package, WinResConfig.ExploreSign1Window.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreSign01_ExploreSignWindowUis(contentPane)
    data = bridgeObj.argTable[1]
    signIndex = {}
    showIndex = 0
    ExploreSign1Window.UpdateTextDisplay()
    local trans = uis.Main.Map.root:GetTransition("in")
    if trans then
      trans:Play()
    end
    ExploreSign1Window.ShowItem()
    ExploreSign1Window.InitBtn()
  end)
end

function ExploreSign1Window.ShowItem()
  if data.isTodaySearch then
    signIndex[data.choosePos[1]] = data.dropRewards
    signIndex[data.choosePos[2]] = data.showRewards
    showIndex = data.choosePos[2]
  end
  local map = uis.Main.Map
  local btn = {
    map.Place1.PlaceBtn,
    map.Place2.PlaceBtn,
    map.Place3.PlaceBtn,
    map.Place4.PlaceBtn,
    map.Place5.PlaceBtn,
    map.Place6.PlaceBtn
  }
  local timeIndex = 0
  uis.Main.Map.ExploreWord.WordTxt.text = T(1865, data.totalCount, data.curCount)
  for i = 1, #btn do
    UIUtil.SetBtnText(btn[i]:GetChild("GetWord"), T(949), T(950))
    UIUtil.SetText(btn[i]:GetChild("SelectedWord"), T(951))
    UIUtil.SetText(btn[i]:GetChild("Searching"), T(953))
    if data.isTodaySearch then
      if signIndex[i] then
        ExploreSign1Window.ShowItemReward(btn[i], signIndex[i])
        timeIndex = timeIndex + 1
        ChangeUIController(btn[i], "c2", showIndex == i and 2 or 3)
      else
        ChangeUIController(btn[i], "c2", 0)
        btn[i].alpha = 0
      end
    else
      PlayUITrans(map[string.format("Place%d", i)].root, "in")
      ChangeUIController(btn[i], "c2", 0)
    end
    btn[i].onClick:Set(function()
      if data.isTodaySearch == false and data.totalCount > data.curCount then
        if signIndex[i] then
          ChangeUIController(btn[i], "c2", 0)
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_OFF)
          signIndex[i] = nil
          if 2 == table.getLen(signIndex) then
            uis.Main.c1Ctr.selectedIndex = 1
            isAct = true
          else
            uis.Main.c1Ctr.selectedIndex = 0
            isAct = false
          end
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_qiqiu_click_cancel")
          return
        end
        local len = table.getLen(signIndex)
        if len >= 2 then
          FloatTipsUtil.ShowWarnTips(T(737))
          return
        end
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_qiqiu_click")
        signIndex[i] = true
        ChangeUIController(btn[i], "c2", 1)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_ON)
        len = len + 1
        if 2 == len then
          uis.Main.c1Ctr.selectedIndex = 1
          isAct = true
        else
          uis.Main.c1Ctr.selectedIndex = 0
          isAct = false
        end
      end
    end)
  end
end

function ExploreSign1Window.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.Explore.ExploreBtn, T(736))
end

function ExploreSign1Window.InitBtn()
  uis.Main.Explore.ExploreBtn.onClick:Set(function()
    if not data.isTodaySearch and 2 == table.getLen(signIndex) then
      pos = {}
      for i, v in pairs(signIndex) do
        table.insert(pos, i)
      end
      SignService.ActivitySearchReq(data.baseInfo.activityId, pos, function(msgRsp)
        local Show = function(msg)
          data.isTodaySearch = true
          data.showRewards = msg.showRewards
          data.dropRewards = msg.dropRewards
          data.specialRewards = msg.specialRewards
          data.choosePos = pos
          data.totalCount = msgRsp.totalCount
          data.curCount = msgRsp.curCount
          SignData.activityData[data.baseInfo.activityId] = data
          uis.Main.c1Ctr.selectedIndex = 0
          ExploreSign1Window.ShowRewardEffect()
          uis.Main.CloseBtn.touchable = true
          uis.Main.Map.ExploreWord.WordTxt.text = T(1865, msgRsp.totalCount, msgRsp.curCount)
        end
        if uis then
          uis.Main.CloseBtn.touchable = false
          local addCallBack = true
          for i = 1, 6 do
            if not table.contain(pos, i) then
              if addCallBack then
                PlayUITrans(uis.Main.Map[string.format("Place%d", i)].root, "out", function()
                  Show(msgRsp)
                end)
              else
                PlayUITrans(uis.Main.Map[string.format("Place%d", i)].root, "out")
              end
            end
          end
        end
      end)
    end
  end)
  uis.Main.c1Ctr.selectedIndex = 0
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreSign1Window.name)
  end)
end

function ExploreSign1Window.ShowItemReward(btn, itemTuple)
  if itemTuple and itemTuple[1] then
    UIUtil.SetIconById(btn:GetChild("ItemLoader"), itemTuple[1].itemId)
    UIUtil.SetText(btn, itemTuple[1].count, "NumberTxt")
    ChangeUIController(btn, "c2", 2)
  end
end

function ExploreSign1Window.ShowReward()
  signIndex[data.choosePos[1]] = data.dropRewards
  signIndex[data.choosePos[2]] = data.showRewards
  showIndex = data.choosePos[2]
  for i, v in pairs(signIndex) do
    ExploreSign1Window.ShowItemReward(uis.Main.Map[string.format("Place%d", i)].PlaceBtn, v)
    ChangeUIController(uis.Main.Map[string.format("Place%d", i)].PlaceBtn, "c2", 2)
  end
end

function ExploreSign1Window.ShowRewardEffect()
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.SIGN_56_EXPLORE)
  ExploreSign1Window.ShowReward()
  LeanTween.delayedCall(0.3, function()
    if uis then
      for i = 1, 6 do
        if signIndex[i] then
          ChangeUIController(uis.Main.Map[string.format("Place%d", i)].PlaceBtn, "c2", showIndex == i and 2 or 3)
        end
      end
      GetItemTips.Show(data.dropRewards)
    end
  end)
end

function ExploreSign1Window.OnClose()
  uis = nil
  contentPane = nil
  if data then
    FunctionQueueUtil.SetFunEnd(tostring(data.baseInfo.activityId))
  end
  data = nil
  activityData = nil
  signIndex = nil
  isAct = nil
  showIndex = nil
end

function ExploreSign1Window.CheckActivityEnd()
  if nil == data or data and LoginData.GetCurServerTime() >= data.baseInfo.endStamp then
    LeanTween.delayedCall(0.15, function()
      MessageBox.Show(T(1618), {
        touchCallback = function()
          UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
        end
      }, nil, {touchable = false})
    end)
  end
end

function ExploreSign1Window.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ExploreSign1Window.CheckActivityEnd()
  end
end

return ExploreSign1Window
