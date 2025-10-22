require("PlayerInfo_BirthdayTipsWindowByName")
local BirthdaySettingWindow = {}
local uis, contentPane
local MONTHS = 12
local selectedDay, selectedMonth, monthTweener, dayTweener
local getDays = function(month)
  if type(month) ~= "number" or month < 1 or month > MONTHS then
    return math.huge
  end
  if 1 == month or 3 == month or 5 == month or 7 == month or 8 == month or 10 == month or 12 == month then
    return 31
  end
  if 2 == month then
    return 29
  end
  return 30
end
local SetMonth = function(month)
  local panel = uis.Main.Rename1
  panel.Day.Time.TimeList.numItems = getDays(month)
end
local TweenContainerY = function(container, y, oncomplete)
  return LeanTween.value(container.y, y, 0.2):setOnUpdate(function(val)
    container.y = val
  end):setOnComplete(oncomplete).id
end
local SetBirthday = function()
  ActorService.SetBirthdayReq(selectedMonth, selectedDay, function()
    UIMgr:CloseWindow(WinResConfig.BirthdaySettingWindow.name)
  end)
end
local sureBtnParam = {touchCallback = SetBirthday}
local UpdateMonth = function(scope)
  local panel = uis.Main.Rename1
  local monthlist = panel.Month.Time.TimeList
  for i = 1, monthlist.numChildren do
    local position = monthlist:GetChildAt(i - 1):TransformPoint(Vector2.zero, monthlist)
    if scope > math.abs(position.y) then
      selectedMonth = i
      SetMonth(selectedMonth)
      break
    end
  end
end
local UpdateDay = function(scope)
  local panel = uis.Main.Rename1
  local daylist = panel.Day.Time.TimeList
  for i = 1, daylist.numChildren do
    local position = daylist:GetChildAt(i - 1):TransformPoint(Vector2.zero, daylist)
    if scope > math.abs(position.y) then
      selectedDay = i
      break
    end
  end
end
local SaveAndClose = function()
  local safeScope = 5
  UpdateMonth(safeScope)
  UpdateDay(safeScope)
  MessageBox.Show(T(20835, selectedMonth, selectedDay), sureBtnParam, {})
end

function BirthdaySettingWindow.ReInitData()
end

function BirthdaySettingWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BirthdaySettingWindow.package, WinResConfig.BirthdaySettingWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlayerInfo_BirthdayTipsWindowUis(contentPane)
    selectedMonth = bridgeObj.argTable[1]
    selectedDay = bridgeObj.argTable[2]
    BirthdaySettingWindow.UpdateInfo()
    BirthdaySettingWindow.InitBtn()
  end)
end

function BirthdaySettingWindow.UpdateInfo()
  local birthdaySettingTips = T(20832)
  local monthText = T(20833)
  local dayText = T(20834)
  local panel = uis.Main.Rename1
  panel.Month.TimeTxt.text = monthText
  panel.Day.TimeTxt.text = dayText
  panel.WordTxt.text = birthdaySettingTips
  local day, month = 1, 1
  if type(selectedDay) ~= "number" then
    selectedDay = day
  end
  if type(selectedMonth) ~= "number" then
    selectedMonth = month
  end
  local monthlist = panel.Month.Time.TimeList
  local daylist = panel.Day.Time.TimeList
  local LINE_HEIGHT = 36
  
  function monthlist.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, i + 1, "NumberTxt")
    gcmp.onClick:Set(function()
      if monthTweener then
        return
      end
      local container = monthlist.container
      monthTweener = TweenContainerY(container, -LINE_HEIGHT * i, function()
        selectedMonth = i + 1
        SetMonth(selectedMonth)
        monthTweener = nil
      end)
    end)
  end
  
  monthlist.numItems = MONTHS
  monthlist.container.y = -(selectedMonth - 1) * LINE_HEIGHT
  
  function daylist.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, i + 1, "NumberTxt")
    gcmp.onClick:Set(function()
      if dayTweener then
        return
      end
      local container = daylist.container
      dayTweener = TweenContainerY(container, -LINE_HEIGHT * i, function()
        selectedDay = i + 1
        dayTweener = nil
      end)
    end)
  end
  
  SetMonth(selectedMonth)
  daylist.container.y = -(selectedDay - 1) * LINE_HEIGHT
  local flag = false
  monthlist.onTouchEnd:Set(function()
    local percY = monthlist.scrollPane.percY
    if Mathf.Approximately(percY, 0) or Mathf.Approximately(percY, 1) then
      flag = true
      UpdateMonth(0.5)
    else
      flag = false
    end
  end)
  monthlist.scrollPane.onScrollEnd:Set(function()
    if not flag then
      UpdateMonth(0.5)
    end
  end)
end

function BirthdaySettingWindow.InitBtn()
  local close = function()
    UIMgr:CloseWindow(WinResConfig.BirthdaySettingWindow.name)
  end
  uis.Main.TouchScreenBtn.onClick:Set(close)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {touchCallback = SaveAndClose}, {touchCallback = close})
end

function BirthdaySettingWindow.OnClose()
  uis = nil
  contentPane = nil
  if dayTweener then
    LeanTween.cancel(dayTweener)
  end
  if monthTweener then
    LeanTween.cancel(monthTweener)
  end
  dayTweener = nil
  monthTweener = nil
end

return BirthdaySettingWindow
