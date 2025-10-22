require("ActivityDungeon1006_PlotWindowByName")
local Activity7PlotWindow = {}
local uis, contentPane, configData

function Activity7PlotWindow.ReInitData()
end

function Activity7PlotWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity7PlotWindow.package, WinResConfig.Activity7PlotWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1006_PlotWindowUis(contentPane)
    local storyId = bridgeObj.argTable[1]
    configData = bridgeObj.argTable[2]
    Activity7PlotWindow.UpdateInfo(storyId)
    Activity7PlotWindow.InitBtn()
  end)
end

function Activity7PlotWindow.UpdateInfo(storyId)
  uis.Main.Word.WordTxt.text = T(1531)
  if configData and storyId then
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(configData.bg_story)
    local list = uis.Main.PlotList
    
    function list.itemRenderer(i, item)
      local tips = item:GetChild("Tips")
      local data = TableData.GetConfig(storyId[i + 1], "BaseStory")
      if data then
        UIUtil.SetText(tips, data.name(), "TitleTxt")
        UIUtil.SetText(tips, data.name_detail(), "WordTxt")
        tips.onClick:Set(function()
          ld("PlotPlay", function()
            LoginData.SetTimeScale(1)
            PlotPlayMgr.PlayFixedPlots(data.story_ids)
          end)
        end)
        ChangeUIController(tips, "c1", 0)
      end
    end
    
    list.numItems = #storyId
  end
end

function Activity7PlotWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity7PlotWindow.CloseWindow)
  uis.Main.ProspectBtn.onClick:Set(function()
    if configData and configData.event_id then
      AbyssExploreMgr.OpenRolePlotEventWindowExternal(configData.event_id)
    end
  end)
  UIUtil.SetText(uis.Main.ProspectBtn, T(1619), "WordTxt")
  ChangeUIController(uis.Main.ProspectBtn, "lock", 1)
end

function Activity7PlotWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity7PlotWindow.name)
end

function Activity7PlotWindow.OnClose()
  uis = nil
  contentPane = nil
  configData = nil
end

return Activity7PlotWindow
