RedDotStory = {}

function RedDotStory.HomeTaskRed()
  return RedDotStory.ItemRedDot() or RedDotStory.CanCradBookReward() or RedDotStory.MonsterRedDot(TableData.GetTable("BaseStoryMonster")) or RedDotStory.MusicRedDot(TableData.GetTable("BaseSound")) or RedDotStory.CGRedDotByTypeData(TableData.GetTable("BaseStoryCg"))
end

function RedDotStory.CGRedDotByTypeData(data)
  for i, v in pairs(data) do
    if RedDotStory.MusicOneShowByChapterId(v.id) then
      return true
    end
  end
end

function RedDotStory.MusicShowByChapterId(id)
  local data = TableData.GetConfig(id, "BaseSoundChapter")
  if data then
    for i = 1, #data.child_ids do
      if RedDotStory.MusicOneShowByChapterId(data.child_ids[i]) then
        return true
      end
    end
  end
end

function RedDotStory.MusicOneShowByChapterId(id)
  if StoryMgr.CheckNewStoryList(id) and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.MusicRedDot(data)
  for i, v in pairs(data) do
    if StoryMgr.CheckNewStoryList(v.id) and not StoryMgr.CheckNew(v.id) then
      return true
    end
  end
end

function RedDotStory.MonsterByCamp(campId)
  local config = TableData.GetTable("BaseStoryMonster")
  local tb = {}
  for i, v in pairs(config) do
    if campId == v.camp_id and RedDotStory.MonsterOneLock(v.id) then
      return true
    end
  end
end

function RedDotStory.MonsterOneLock(id)
  if table.contain(StoryMgr.monsterIds, id) and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.MonsterRedDot(data)
  if data then
    for i, v in pairs(data) do
      if RedDotStory.MonsterOneLock(v.id) then
        return true
      end
    end
  end
end

function RedDotStory.ItemOneLock(id)
  if ActorData.GetItemCount(id) > 0 and not StoryMgr.CheckNew(id) then
    return true
  end
end

function RedDotStory.ItemRedDot()
  local config = TableData.GetTable("BaseItem")
  for i, v in pairs(config) do
    if 106 == v.type and ActorData.GetItemCount(v.id) > 0 and not StoryMgr.CheckNew(v.id) then
      return true
    end
  end
end

function RedDotStory.GetStar()
  local cardList = ActorData.GetCardList()
  local star = 0
  for i, v in pairs(cardList) do
    star = star + v.grade
  end
  return star
end

function RedDotStory.CanCradStarUp()
  local data = TableData.GetTable("BaseCardHandBookGrow")
  local handBookData = {}
  for i, v in pairs(data) do
    table.insert(handBookData, v)
  end
  table.sort(handBookData, function(a, b)
    return a.id < b.id
  end)
  local info = ActorData.GetActorInfo()
  local costStar = 0
  for i, v in ipairs(handBookData) do
    if v.id <= info.activeHandBookGrowId then
      costStar = costStar + v.star_cost
    else
      break
    end
  end
  local curData = TableData.GetConfig(info.activeHandBookGrowId, "BaseCardHandBookGrow")
  local nextId = 0
  if 0 == info.activeHandBookGrowId then
    nextId = handBookData[1].id
  elseif curData and curData.next then
    nextId = curData.next
  end
  local nextData = TableData.GetConfig(nextId, "BaseCardHandBookGrow")
  if nextData then
    local tatal = RedDotStory.GetStar()
    return tatal - costStar >= nextData.star_cost
  end
end

function RedDotStory.CanCradBookReward()
  local cardList = ActorData.GetCardList()
  for i = 1, #cardList do
    if not cardList[i].handBookReward then
      return true
    end
  end
end
