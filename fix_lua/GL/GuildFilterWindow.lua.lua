require("Guild_GuildFilterWindowByName")
local GuildFilterWindow = {}
local uis, contentPane, searchTxt, policyId, searchName, guildMin, guildMax, guildLimit, bossRank

function GuildFilterWindow.ReInitData()
end

function GuildFilterWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildFilterWindow.package, WinResConfig.GuildFilterWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuild_GuildFilterWindowUis(contentPane)
    local setting = bridgeObj.argTable[1]
    if setting then
      GuildFilterWindow.SettingInfo()
    else
      GuildData.cacheSearch = GuildData.cacheSearch or {}
      GuildFilterWindow.SearchInfo()
    end
    GuildFilterWindow.InitBtn()
  end)
end

function GuildFilterWindow.SettingInfo()
  local list = uis.Main.Tips.SetList
  local infoPolicy = UIMgr:CreateObject("Guild", "GuildFilter_Info2")
  UIUtil.SetText(infoPolicy, T(2031), "TtileTxt")
  local policyList = infoPolicy:GetChild("OptionList")
  local dataPolicy = GuildFilterWindow.GetPolicy()
  policyId = GuildData.GuildInfo.info.policy or 0
  
  function policyList.itemRenderer(i, item)
    UIUtil.SetText(item:GetChild("MoveWord"), dataPolicy[i + 1].name())
    item.onClick:Set(function()
      policyId = dataPolicy[i + 1].id
      policyList.selectedIndex = i
    end)
    if policyId == dataPolicy[i + 1].id then
      item.onClick:Call()
    end
  end
  
  policyList.numItems = #dataPolicy
  policyList:ResizeToFit()
  list:AddChild(infoPolicy)
  UIUtil.SetText(uis.Main.Tips.SureBtn, T(2030))
  uis.Main.Tips.SureBtn.onClick:Set(function()
    GuildService.SetGuildPolicyReq(policyId, function()
      GuildData.GuildInfo.info.policy = policyId
      UIMgr:SendWindowMessage(WinResConfig.GuildWindow.name, WindowMsgEnum.GuildWindow.CHANGE_POLICY, nil)
      GuildFilterWindow.CloseWindow()
    end)
  end)
  uis.Main.Tips.c1Ctr.selectedIndex = 1
end

function GuildFilterWindow.SearchInfo()
  local list = uis.Main.Tips.SearchList
  local infoName = UIMgr:CreateObject("Guild", "GuildFilter_Info1")
  UIUtil.SetText(infoName, T(2020), "TtileTxt")
  searchTxt = infoName:GetChild("NameTxt")
  if searchTxt then
    searchTxt.promptText = T(1126)
    searchTxt.onFocusOut:Set(function()
      searchTxt.text = SensitiveWordsUtil.FilterWord(searchTxt.text)
    end)
  end
  if GuildData.cacheSearch.name then
    searchTxt.text = GuildData.cacheSearch.name
  end
  list:AddChild(infoName)
  local infoNumber = UIMgr:CreateObject("Guild", "GuildFilter_Info2")
  UIUtil.SetText(infoNumber, T(2021), "TtileTxt")
  GuildData.cacheSearch.optionListIndex = GuildData.cacheSearch.optionListIndex or 0
  local optionList = infoNumber:GetChild("OptionList")
  local data = GuildFilterWindow.GetNumber()
  
  function optionList.itemRenderer(i, item)
    UIUtil.SetText(item:GetChild("MoveWord"), data[i + 1].max and T(2023, data[i + 1].min, data[i + 1].max) or T(2022))
    item.onClick:Set(function()
      optionList.selectedIndex = i
      guildMin = data[i + 1].min or 0
      guildMax = data[i + 1].max or 0
    end)
    if i == GuildData.cacheSearch.optionListIndex then
      item.onClick:Call()
    end
  end
  
  optionList.numItems = #data
  optionList:ResizeToFit()
  list:AddChild(infoNumber)
  local infoLimit = UIMgr:CreateObject("Guild", "GuildFilter_Info2")
  UIUtil.SetText(infoLimit, T(2024), "TtileTxt")
  GuildData.cacheSearch.guildListIndex = GuildData.cacheSearch.guildListIndex or 0
  local limitList = infoLimit:GetChild("OptionList")
  local dataLimit = {
    T(2022),
    T(2025),
    T(2026)
  }
  
  function limitList.itemRenderer(i, item)
    UIUtil.SetText(item:GetChild("MoveWord"), dataLimit[i + 1])
    item.onClick:Set(function()
      limitList.selectedIndex = i
      guildLimit = i
    end)
    if i == GuildData.cacheSearch.guildListIndex then
      item.onClick:Call()
    end
  end
  
  limitList.numItems = #dataLimit
  limitList:ResizeToFit()
  list:AddChild(infoLimit)
  local infoPolicy = UIMgr:CreateObject("Guild", "GuildFilter_Info2")
  UIUtil.SetText(infoPolicy, T(2027), "TtileTxt")
  local policyList = infoPolicy:GetChild("OptionList")
  local dataPolicy = GuildFilterWindow.GetPolicy()
  table.insert(dataPolicy, 1, {
    id = 0,
    name = function()
      return T(2022)
    end
  })
  policyId = 0
  GuildData.cacheSearch.policyListIndex = GuildData.cacheSearch.policyListIndex or 0
  
  function policyList.itemRenderer(i, item)
    UIUtil.SetText(item:GetChild("MoveWord"), dataPolicy[i + 1].name())
    item.onClick:Set(function()
      policyId = dataPolicy[i + 1].id
      policyList.selectedIndex = i
    end)
    if i == GuildData.cacheSearch.policyListIndex then
      item.onClick:Call()
    end
  end
  
  policyList.numItems = #dataPolicy
  policyList:ResizeToFit()
  list:AddChild(infoPolicy)
  local infoBossRank = UIMgr:CreateObject("Guild", "GuildFilter_Info2")
  UIUtil.SetText(infoBossRank, T(2060), "TtileTxt")
  local bossRankList = infoBossRank:GetChild("OptionList")
  local dataRank = {
    T(2061),
    T(2062),
    T(2063),
    T(2064),
    T(2065),
    T(2066)
  }
  bossRank = 0
  GuildData.cacheSearch.bossRankIndex = GuildData.cacheSearch.bossRankIndex or 0
  
  function bossRankList.itemRenderer(i, item)
    UIUtil.SetText(item:GetChild("MoveWord"), dataRank[i + 1])
    item.onClick:Set(function()
      bossRank = i
      bossRankList.selectedIndex = i
    end)
    if i == GuildData.cacheSearch.bossRankIndex then
      item.onClick:Call()
    end
  end
  
  bossRankList.numItems = #dataRank
  bossRankList:ResizeToFit()
  list:AddChild(infoBossRank)
  UIUtil.SetText(uis.Main.Tips.ResetBtn, T(2028))
  uis.Main.Tips.ResetBtn.onClick:Set(function()
    GuildData.cacheSearch = {}
    searchTxt.text = ""
    optionList:GetChildAt(0).onClick:Call()
    limitList:GetChildAt(0).onClick:Call()
    policyList:GetChildAt(0).onClick:Call()
    bossRankList:GetChildAt(0).onClick:Call()
  end)
  UIUtil.SetText(uis.Main.Tips.SearchBtn, T(2029))
  uis.Main.Tips.SearchBtn.onClick:Set(function()
    GuildData.cacheSearch = {
      name = searchTxt.text,
      optionListIndex = optionList.selectedIndex,
      guildListIndex = limitList.selectedIndex,
      policyListIndex = policyList.selectedIndex,
      bossRankIndex = bossRankList.selectedIndex
    }
    GuildService.SearchGuildByConditionsReq(searchTxt.text, tonumber(guildMin), tonumber(guildMax), guildLimit, policyId, bossRank, 0, function(msg)
      GuildFilterWindow.CloseWindow()
      GuildData.ListInfos = msg.infos
      UIMgr:SendWindowMessage(WinResConfig.GuildListWindow.name, WindowMsgEnum.GuildWindow.INIT_LIST_INFO, 0)
    end)
  end)
  uis.Main.Tips.c1Ctr.selectedIndex = 0
end

function GuildFilterWindow.GetPolicy()
  local data = TableData.GetTable("BaseGuildPolicy")
  local count = {}
  for i, v in pairs(data) do
    table.insert(count, v)
  end
  table.sort(count, function(a, b)
    return a.sort < b.sort
  end)
  return count
end

function GuildFilterWindow.GetNumber()
  local str = TableData.GetConfig(70010318, "BaseFixed").array_value
  local arr = Split(str, "|")
  local count = {}
  for i = 1, #arr do
    local info = Split(arr[i], ":")
    table.insert(count, {
      min = info[1],
      max = info[2]
    })
  end
  return count
end

function GuildFilterWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.GuildFilterWindow.name)
end

function GuildFilterWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(GuildFilterWindow.CloseWindow)
  uis.Main.Tips.CloseBtn.onClick:Set(GuildFilterWindow.CloseWindow)
end

function GuildFilterWindow.OnClose()
  uis = nil
  contentPane = nil
  searchTxt = nil
  policyId = nil
  searchName = nil
  guildMin = nil
  guildMax = nil
  guildLimit = nil
  bossRank = nil
end

return GuildFilterWindow
