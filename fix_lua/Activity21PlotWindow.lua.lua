require("ActivityDungeon1021_PlotWindowByName")
local Activity21PlotWindow = {}
local uis, contentPane, configData

function Activity21PlotWindow.ReInitData()
end

function Activity21PlotWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21PlotWindow.package, WinResConfig.Activity21PlotWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1021_PlotWindowUis(contentPane)
    local storyId = bridgeObj.argTable[1]
    configData = bridgeObj.argTable[2]
    Activity21PlotWindow.UpdateInfo(storyId)
    Activity21PlotWindow.InitBtn()
  end)
end

function Activity21PlotWindow.UpdateInfo(storyId)
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

function Activity21PlotWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity21PlotWindow.CloseWindow)
  uis.Main.ProspectBtn.onClick:Set(function()
    if configData and configData.event_id then
      AbyssExploreMgr.OpenRolePlotEventWindowExternal(configData.event_id)
    end
  end)
  UIUtil.SetText(uis.Main.ProspectBtn, T(1619), "WordTxt")
  ChangeUIController(uis.Main.ProspectBtn, "lock", 1)
end

function Activity21PlotWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity21PlotWindow.name)
end

function Activity21PlotWindow.OnClose()
  uis = nil
  contentPane = nil
  configData = nil
end

return Activity21PlotWindow
