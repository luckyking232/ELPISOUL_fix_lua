require("Schedule_BoxGetWindowByName")
local BoxGetWindow = {}
local uis, contentPane

function BoxGetWindow.ReInitData()
end

function BoxGetWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BoxGetWindow.package, WinResConfig.BoxGetWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSchedule_BoxGetWindowUis(contentPane)
    local reward = bridgeObj.argTable[1]
    local newReward = {}
    for i = 1, #reward do
      if reward[i].rewards[1] then
        table.insert(newReward, reward[i])
      end
    end
    BoxGetWindow.UpdateInfo(newReward)
    BoxGetWindow.InitBtn()
  end)
end

function BoxGetWindow.UpdateInfo(reward)
  if reward then
    local list = uis.Main.BoxGetTips.EntryList.EntryList
    
    function list.itemRenderer(i, tips)
      local item = tips:GetChild("Entry")
      local eventData = TableData.GetConfig(reward[i + 1].event.eventId, "BaseManorEvent")
      if eventData then
        local infoReward = reward[i + 1].rewards[1]
        if infoReward then
          local itemData
          if 1 == infoReward.tupleType then
            itemData = TableData.GetConfig(infoReward.itemId, "BaseItem")
            local text = T(1758, itemData.name(), infoReward.count)
            BoxGetWindow.WordList(item:GetChild("WordList"), text)
            ChangeUIController(item, "c1", 0)
          elseif 7 == infoReward.tupleType then
            itemData = TableData.GetConfig(infoReward.itemId, "BaseStoryMonster")
            local text = T(1761, itemData.name and itemData.name() or "")
            BoxGetWindow.WordList(item:GetChild("WordList"), text)
            ChangeUIController(item, "c1", 3)
          elseif 6 == infoReward.tupleType then
            itemData = TableData.GetConfig(infoReward.itemId, "BaseSound")
            local text = T(1760, itemData.name and itemData.name() or "")
            BoxGetWindow.WordList(item:GetChild("WordList"), text)
            ChangeUIController(item, "c1", 2)
          end
        end
      end
      UIUtil.SetText(item, LuaUtil.FormatNum(i + 1, "00"), "NumberTxt")
      item.alpha = 0
      PlayUITrans(tips, "up", function()
        list:ScrollToView(i, true)
      end, i * 0.25 * 0.6)
    end
    
    list.numItems = #reward
  end
  uis.Main.BoxGetTips.WordTxt.text = T(1757)
end

function BoxGetWindow.WordList(list, text)
  function list.itemRenderer(i, gcmp)
    local wordTxt = gcmp:GetChild("WordTxt")
    
    wordTxt.text = text
  end
  
  list.numItems = 1
end

function BoxGetWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BoxGetWindow.name)
  end)
  uis.Main.BoxGetTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BoxGetWindow.name)
  end)
end

function BoxGetWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BoxGetWindow
