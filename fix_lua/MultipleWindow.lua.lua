require("MultipleMaterials_MultipleWindowByName")
local MultipleWindow = {}
local uis, contentPane

function MultipleWindow.ReInitData()
end

function MultipleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MultipleWindow.package, WinResConfig.MultipleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMultipleMaterials_MultipleWindowUis(contentPane)
    MultipleWindow.UpdateInfo()
    MultipleWindow.InitBtn()
  end)
end

function MultipleWindow.UpdateInfo()
  local config = TableData.GetConfig(70061003, "BaseActivity")
  uis.Main.PicLoader.url = UIUtil.GetResUrl(config.bg_pic)
  local GetUnLock = function()
    if AbyssExploreData then
      local manorInfo = AbyssExploreData.GetManorInfo()
      return manorInfo and manorInfo.rookieFinished
    end
  end
  local list = uis.Main.FunctionList
  local infos = AdventureData.GetAllMultiDropInfo()
  table.sort(infos, function(a, b)
    return a.dailyDrop[1].type < b.dailyDrop[1].type
  end)
  local wordTb = {
    [1] = {
      name = T(2069),
      multiId = 2071
    },
    [2] = {
      name = T(2070),
      multiId = 2072
    }
  }
  
  function list.itemRenderer(i, item)
    ChangeUIController(item, "c1", infos[i + 1].dailyDrop[1].type - 1)
    UIUtil.SetText(item, T(2073, TimeUtil.FormatEnTime(infos[i + 1].baseInfo.endStamp - LoginData.GetCurServerTime())), "TimeTxt")
    local GoBtn = item:GetChild("GoBtn")
    UIUtil.SetText(GoBtn, T(2075), "WordTxt")
    GoBtn.onClick:Set(function()
      if 1 == infos[i + 1].dailyDrop[1].type then
        CurrencyReturnWindow.jumpExperiment()
      elseif 2 == infos[i + 1].dailyDrop[1].type and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE) then
        if GetUnLock() then
          AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, function()
            OpenWindow(WinResConfig.AbyssActivityWindow.name, nil, AbyssExploreEventID.CHALLENGE_BOSS)
          end)
        else
          AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS)
        end
      end
    end)
    UIUtil.SetText(item, wordTb[infos[i + 1].dailyDrop[1].type].name, "NameTxt")
    local conf = AdventureData.GetMultiDropConfig(infos[i + 1].baseInfo.activityId)
    if conf then
      UIUtil.SetText(item, T(wordTb[infos[i + 1].dailyDrop[1].type].multiId, conf.showMulti), "WordTxt")
      if infos[i + 1].dailyDrop[1].count > 0 then
        UIUtil.SetText(item, T(2076, infos[i + 1].dailyDrop[1].count, conf.max), "NumberTxt")
      else
        UIUtil.SetText(item, T(2074, infos[i + 1].dailyDrop[1].count, conf.max), "NumberTxt")
      end
    end
  end
  
  list.numItems = #infos
end

function MultipleWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.MultipleWindow.name)
end

function MultipleWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(MultipleWindow.CloseWindow)
  uis.Main.CloseBtn.onClick:Set(MultipleWindow.CloseWindow)
end

function MultipleWindow.OnClose()
  uis = nil
  contentPane = nil
end

function MultipleWindow.CheckActivityEnd()
  local infos = AdventureData.GetAllMultiDropInfo()
  local close = true
  if infos then
    for i = 1, #infos do
      if infos[i].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
        close = nil
      end
    end
  end
  if close then
    LeanTween.delayedCall(0.15, function()
      MessageBox.Show(T(1618), {
        touchCallback = function()
          UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
        end
      }, nil, {touchable = false})
    end)
  end
end

function MultipleWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    MultipleWindow.CheckActivityEnd()
  elseif msgId == WindowMsgEnum.SignWindow.UPDATE_MULTIPLE then
    MultipleWindow.UpdateInfo()
  end
end

return MultipleWindow
