require("Sign_SignWindowByName")
local SignWindow = {}
local uis, contentPane, data, activityData, signData

function SignWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SignWindow.package, WinResConfig.SignWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSign_SignWindowUis(contentPane)
    data = bridgeObj.argTable[1]
    SignWindow.InitBtn()
    if data then
      local pic = {
        uis.Main.Sign1.Pic1Loader,
        uis.Main.Sign1.Pic2Loader,
        uis.Main.Sign1.Pic3Loader,
        uis.Main.Sign1.Module4.PicLoader,
        uis.Main.Sign1.Module5.PicLoader
      }
      activityData = TableData.GetConfig(data.baseInfo.activityId, "BaseActivity")
      local type = tonumber(activityData.parameter)
      if activityData then
        uis.Main.Sign1.c1Ctr.selectedIndex = activityData.type_sub - 1
        pic[activityData.type_sub].url = UIUtil.GetResUrl(activityData.bg_pic)
      end
      signData = SignData.GetSignData(type)
      if 3 == activityData.type_sub then
        SignWindow.InitModule()
      elseif 1 == activityData.type_sub or 2 == activityData.type_sub then
        local list = 1 == activityData.type_sub and uis.Main.Sign1.Module1.RewardList or uis.Main.Sign1.Module2.RewardList
        SignWindow.InitModuleList(list, activityData.type_sub)
      elseif 4 == activityData.type_sub then
        SignWindow.InitModuleFour()
      elseif 5 == activityData.type_sub then
        SignWindow.InitModuleCard()
      end
    end
  end)
end

function SignWindow.InitModuleCard()
  local tips = uis.Main.Sign1.Module5
  tips.c1Ctr.selectedIndex = 0
  UIUtil.SetText(tips.GetBtn, T(1385))
  tips.Obtain.WordTxt.text = T(1383)
  tips.GetBtn.onClick:Set(function()
    if LoginData.GetCurServerTime() > data.baseInfo.endStamp then
      FloatTipsUtil.ShowWarnTips(T(1618))
      SignWindow.CloseWindow()
      return
    end
    SignService.ActivitySignInReq(data.baseInfo.activityId, function(rspMsg)
      if uis then
        tips.c1Ctr.selectedIndex = 1
      end
      GetItemTips.Show(rspMsg.rewards)
    end)
  end)
  tips.CloseBtn.onClick:Set(SignWindow.CloseWindow)
end

function SignWindow.InitModuleFour()
  local tips = uis.Main.Sign1.Module4
  tips.c1Ctr.selectedIndex = 0
  UIUtil.SetText(tips.GetBtn, T(1385))
  tips.GetBtn.onClick:Set(function()
    if LoginData.GetCurServerTime() > data.baseInfo.endStamp then
      FloatTipsUtil.ShowWarnTips(T(1618))
      SignWindow.CloseWindow()
      return
    end
    SignService.ActivitySignInReq(data.baseInfo.activityId, function(rspMsg)
      if uis then
        tips.c1Ctr.selectedIndex = 1
      end
      GetItemTips.Show(rspMsg.rewards)
    end)
  end)
  tips.CloseBtn.onClick:Set(SignWindow.CloseWindow)
end

function SignWindow.InitModule()
  uis.Main.Sign1.Module3.c1Ctr.selectedIndex = 0 == data.curDay and 0 or 1
  UIUtil.SetBtnText(uis.Main.Sign1.Module3.SureBtn, T(1858), T(333))
  UIUtil.SetBtnText(uis.Main.Sign1.Module3.Module3Received.root, T(1857), T(945))
  if 1 == #signData then
    local arr = GetConfigItemList(signData[1].reward, true)
    if 1 == #arr then
      UIUtil.ShowItemFrame(arr[1].id, uis.Main.Sign1.Module3.Item.root, arr[1].value)
      uis.Main.Sign1.Module3.Item.ItemLoader.onClick:Set(function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        UIUtil.OpenPreviewTips(arr[1].id, arr[1].type)
      end)
    end
  end
  uis.Main.Sign1.Module3.SureBtn.onClick:Set(function()
    if LoginData.GetCurServerTime() > data.baseInfo.endStamp then
      FloatTipsUtil.ShowWarnTips(T(1618))
      SignWindow.CloseWindow()
      return
    end
    SignService.ActivitySignInReq(data.baseInfo.activityId, function(rspMsg)
      GetItemTips.Show(rspMsg.rewards)
    end)
  end)
end

function SignWindow.SetDayTips(item, day, type)
  UIUtil.SetText(item, day, "NumberTxt")
  if 1 == type then
    UIUtil.SetText(item, day, "NumberDecTxt")
  else
    UIUtil.SetText(item, T(942), "NumberDecTxt")
  end
end

function SignWindow.InitModuleList(list, type)
  local selectedIndex = 0
  
  function list.itemRenderer(i, item)
    SignWindow.ShowReward(signData[i + 1].reward, item:GetChild("ItemList"))
    ChangeUIController(item, "c2", 1 == #signData[i + 1].reward and 0 or 1)
    SignWindow.SetDayTips(item:GetChild("ColorTips"), LuaUtil.FormatNum(signData[i + 1].day, "00"), type)
    SignWindow.SetDayTips(item:GetChild("GreenTips"), LuaUtil.FormatNum(signData[i + 1].day, "00"), type)
    UIUtil.SetText(item, T(943), "WordTxt")
    local day = data.isTodaySignIn and data.curDay or data.curDay + 1
    if day > signData[i + 1].day then
      ChangeUIController(item, nil, 2)
      UIUtil.SetBtnText(item, T(944), T(945))
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(7001601))
      end)
    elseif day == signData[i + 1].day then
      if data.isTodaySignIn then
        ChangeUIController(item, nil, 2)
        UIUtil.SetBtnText(item, T(944), T(945))
        item.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(7001601))
        end)
      else
        ChangeUIController(item, nil, 1)
        item.onClick:Set(function()
          if LoginData.GetCurServerTime() > data.baseInfo.endStamp then
            FloatTipsUtil.ShowWarnTips(T(1618))
            SignWindow.CloseWindow()
            return
          end
          SignService.ActivitySignInReq(data.baseInfo.activityId, function(rspMsg)
            if uis then
              ChangeUIController(item, nil, 2)
            end
            GetItemTips.Show(rspMsg.rewards)
          end)
        end)
      end
      selectedIndex = i
    elseif day < signData[i + 1].day then
      ChangeUIController(item, nil, 0)
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(602))
      end)
    end
  end
  
  list.numItems = #signData
  list:ScrollToView(selectedIndex)
end

function SignWindow.ShowReward(reward, list)
  local arr = GetConfigItemList(reward, true)
  
  function list.itemRenderer(i, item)
    UIUtil.ShowItemFrame(arr[i + 1].id, item, arr[i + 1].value)
  end
  
  list.numItems = #arr
end

function SignWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.SignWindow.name)
  end)
  uis.Main.Sign1.Close1Btn.onClick:Set(SignWindow.CloseWindow)
  uis.Main.Sign1.Close2Btn.onClick:Set(SignWindow.CloseWindow)
  uis.Main.Sign1.Close3Btn.onClick:Set(SignWindow.CloseWindow)
end

function SignWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.SignWindow.name)
end

function SignWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.SignWindow.GET_REWARD then
    data = para
    local type = activityData.type_sub
    if 3 == type then
      uis.Main.Sign1.Module3.c1Ctr.selectedIndex = 1
    elseif 1 == type then
      uis.Main.Sign1.Module1.RewardList.numItems = #signData
    elseif 2 == type then
      uis.Main.Sign1.Module2.RewardList.numItems = #signData
    end
  end
end

function SignWindow.OnClose()
  if data then
    FunctionQueueUtil.SetFunEnd(tostring(data.baseInfo.activityId))
  end
  uis = nil
  contentPane = nil
  data = nil
  activityData = nil
  signData = nil
end

function SignWindow.CheckActivityEnd()
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

function SignWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    SignWindow.CheckActivityEnd()
  end
end

return SignWindow
