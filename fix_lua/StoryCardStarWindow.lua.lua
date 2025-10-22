require("Story_CardStarWindowByName")
local StoryCardStarWindow = {}
local uis, contentPane, handBookData, lastAttAdd

function StoryCardStarWindow.ReInitData()
end

function StoryCardStarWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StoryCardStarWindow.package, WinResConfig.StoryCardStarWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetStory_CardStarWindowUis(contentPane)
    local data = TableData.GetTable("BaseCardHandBookGrow")
    handBookData = {}
    for i, v in pairs(data) do
      table.insert(handBookData, v)
    end
    table.sort(handBookData, function(a, b)
      return a.id < b.id
    end)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Member_tips/FX_member_tips_circle.prefab", uis.Main.Tips.EffectHolder)
    StoryCardStarWindow.UpdateInfo()
    StoryCardStarWindow.InitBtn()
  end)
end

function StoryCardStarWindow.UpdateInfo(playAnim)
  local tips = uis.Main.Tips
  tips.Info.WordTxt.text = T(2019)
  local attributeWord = {
    [ProtoEnum.ATTR_ID.ATK] = T(80000103),
    [ProtoEnum.ATTR_ID.DEF] = T(80000104),
    [ProtoEnum.ATTR_ID.MAX_HP] = T(80000102)
  }
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  local cardAttributeList = tips.AttributeList
  local info = ActorData.GetActorInfo()
  local attArr, costStar, groupData = StoryCardStarWindow.GetAttData(info.activeHandBookGrowId)
  tips.Info.NumberTxt.text = costStar
  
  function cardAttributeList.itemRenderer(i, item)
    local index = i + 1
    local attributeId = attributeNun[index]
    ChangeUIController(item, "c1", i)
    UIUtil.SetText(item, attributeWord[attributeId], "NameTxt")
    UIUtil.SetText(item, attArr[attributeId] or 0, "NumberTxt")
    if lastAttAdd and attArr[attributeId] ~= lastAttAdd[attributeId] then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_honor_lvup")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Member_tips/FX_member_tips_levelup_number.prefab", item:GetChild("EffectHolder"), nil, true)
    end
  end
  
  cardAttributeList.numItems = #attributeNun
  local curData = TableData.GetConfig(info.activeHandBookGrowId, "BaseCardHandBookGrow")
  local nextId = 0
  if 0 == info.activeHandBookGrowId then
    nextId = groupData[1].id
  elseif curData and curData.next then
    nextId = curData.next
  end
  local curGroup = groupData[1].group
  local tatal = StoryCardStarWindow.GetStar()
  
  function tips.DotList.itemRenderer(i, item)
    ChangeUIController(item:GetChild("Dot1"), "c1", groupData[i + 1].show_type)
    if groupData[i + 1].id == nextId then
      local arrDot = Split(groupData[i + 1].add_attr[1], ":")
      if arrDot then
        local attributeId = tonumber(arrDot[2])
        UIUtil.SetText(item:GetChild("Dot2"), groupData[i + 1].star_cost, "NumberTxt")
        UIUtil.SetText(item:GetChild("Dot3"), T(2148, attributeWord[attributeId], arrDot[3]), "NumberTxt")
      end
      ChangeUIController(item, "c1", 1)
      local activateBtn = item:GetChild("Dot4Btn")
      UIUtil.SetText(activateBtn, T(2149), "WordTxt")
      ChangeUIController(item, "c2", tatal - costStar >= groupData[i + 1].star_cost and 0 or 1)
      activateBtn.onClick:Set(function()
        if tatal - costStar >= groupData[i + 1].star_cost then
          local Send = function(bookGrowId, waitTime)
            CardService.ActivateHandBookGrowReq(bookGrowId, function()
              if uis then
                local animBol = false
                info = ActorData.GetActorInfo()
                curData = TableData.GetConfig(info.activeHandBookGrowId, "BaseCardHandBookGrow")
                if curData and curData.next then
                  local nextData = TableData.GetConfig(curData.next, "BaseCardHandBookGrow")
                  if nextData and curGroup and nextData.group ~= curGroup then
                    animBol = true
                  end
                end
                LeanTween.delayedCall(waitTime or 0, function()
                  if bookGrowId > 0 then
                    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Member_tips/FX_member_tips_levelup.prefab", item:GetChild("Dot1"):GetChild("EffectHolder"), nil, true)
                  end
                end)
                uis.root.touchable = false
                if animBol then
                  for index = 0, tips.DotList.numChildren - 1 do
                    PlayUITrans(tips.DotList:GetChildAt(index), "out1")
                  end
                  LeanTween.delayedCall(0.88, function()
                    uis.root.touchable = true
                    StoryCardStarWindow.UpdateInfo(animBol)
                  end)
                else
                  LeanTween.delayedCall(waitTime or 0, function()
                    uis.root.touchable = true
                    StoryCardStarWindow.UpdateInfo()
                  end)
                end
                RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.STORY)
              end
            end)
          end
          if tatal - costStar - groupData[i + 1].star_cost > 0 then
            MessageBox.Show(T(2150), {
              touchCallback = function()
                Send(0)
              end,
              titleText = T(2151)
            }, {
              touchCallback = function()
                Send(groupData[i + 1].id, 0.32)
              end,
              titleText = T(2152)
            })
          else
            Send(groupData[i + 1].id)
          end
        end
      end)
    elseif groupData[i + 1].id <= info.activeHandBookGrowId then
      ChangeUIController(item, "c1", 2)
      if playAnim then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Member_tips/FX_member_tips_levelup.prefab", item:GetChild("Dot1"):GetChild("EffectHolder"), nil, true)
      end
    else
      ChangeUIController(item, "c1", 0)
    end
    if playAnim then
      PlayUITrans(item, "in1", nil, 0.08 * i)
    end
  end
  
  tips.DotList.numItems = #groupData
  lastAttAdd = attArr
end

function StoryCardStarWindow.GetAttData(bookId)
  local arr = {
    [ProtoEnum.ATTR_ID.ATK] = 0,
    [ProtoEnum.ATTR_ID.DEF] = 0,
    [ProtoEnum.ATTR_ID.MAX_HP] = 0
  }
  local Add = function(arrList)
    for k, v in pairs(arrList) do
      arr[k] = arr[k] + v.value
    end
  end
  local groupData = {}
  local costStar = 0
  local group = 1
  for i, v in ipairs(handBookData) do
    group = v.group
    if bookId >= v.id then
      costStar = costStar + v.star_cost
      Add(GetAddAttrList(v.add_attr))
    else
      break
    end
  end
  for i, v in ipairs(handBookData) do
    if v.group == group then
      table.insert(groupData, v)
    end
  end
  return arr, costStar, groupData
end

function StoryCardStarWindow.GetStar()
  local cardList = ActorData.GetCardList()
  local star = 0
  for i, v in pairs(cardList) do
    star = star + v.grade
  end
  return star
end

function StoryCardStarWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.StoryCardStarWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.StoryCardStarWindow.name)
  end)
end

function StoryCardStarWindow.OnClose()
  uis = nil
  contentPane = nil
  handBookData = nil
  lastAttAdd = nil
end

return StoryCardStarWindow
