local CardIsUsedInUpgradeDungeon = function(cardId)
  local info = ExploreDungeonData.GetPlayerInfo()
  local usedCards = info.usedCards
  if usedCards then
    local k = table.keyof(usedCards, cardId)
    return type(k) == "number"
  end
  return false
end
local GetChapters = function(buffer)
  local info = ExploreDungeonData.GetPlayerInfo()
  local currentChapter = info.currentChapter
  local conf = TableData.GetConfig(currentChapter, "BaseChapter")
  local cur = conf
  buffer = buffer or {}
  table.insert(buffer, cur)
  while cur do
    cur = TableData.GetConfig(cur.pre, "BaseChapter")
    if cur then
      table.insert(buffer, 1, cur)
    end
  end
  cur = conf
  while cur do
    cur = TableData.GetConfig(cur.next, "BaseChapter")
    if cur then
      table.insert(buffer, cur)
    end
  end
  return buffer
end
local GetOutputs = function(chapterIndex, stageIndex, buffer)
  if type(chapterIndex) == "number" and chapterIndex > 0 then
    local chapters = GetChapters()
    local chapter = chapters[chapterIndex]
    local stages = chapter.stages
    if type(stageIndex) == "number" and stageIndex > 0 and stageIndex <= #stages then
      buffer = buffer or {}
      local stageConf = TableData.GetConfig(stages[stageIndex], "BaseStage")
      for _, str in ipairs(stageConf.on_hook_reward) do
        local splits = Split(str, ":")
        local itemId = tonumber(splits[2])
        local count = tonumber(splits[3])
        local k = table.keyof(buffer, itemId, "itemId")
        if k then
          buffer[k].addition = count
        else
          table.insert(buffer, {
            itemType = tonumber(splits[1]),
            itemId = itemId,
            count = count
          })
        end
      end
      return buffer
    end
  end
  buffer = buffer or {}
  local strs = Split(TableData.GetConfig(70011702, "BaseFixed").array_value, "|")
  for _, str in ipairs(strs) do
    local splits = Split(str, ":")
    table.insert(buffer, {
      itemType = tonumber(splits[1]),
      itemId = tonumber(splits[2]),
      count = tonumber(splits[3])
    })
  end
  return buffer
end
local chapterBuffer
local GetPassedIndexes = function()
  chapterBuffer = chapterBuffer or {}
  table.clear(chapterBuffer)
  local chapters = GetChapters(chapterBuffer)
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local currentStage, currentChapter = playerInfo.currentStage, playerInfo.currentChapter
  local chapterIndex = table.keyof(chapters, currentChapter, "id")
  local stageIndex
  if currentStage > 0 then
    stageIndex = table.keyof(chapters[chapterIndex].stages, currentStage)
  else
    chapterIndex = chapterIndex + 1
    stageIndex = 1
  end
  if stageIndex > 1 then
    return chapterIndex, stageIndex - 1
  elseif chapterIndex > 1 then
    return chapterIndex - 1, #chapters[chapterIndex - 1].stages
  end
  return 1, 0
end
local GetCurrentOutputs = function()
  chapterBuffer = chapterBuffer or {}
  table.clear(chapterBuffer)
  local chapters = GetChapters(chapterBuffer)
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local currentStage, currentChapter = playerInfo.currentStage, playerInfo.currentChapter
  local chapterIndex = table.keyof(chapters, currentChapter, "id")
  local stageIndex
  if currentStage > 0 then
    stageIndex = table.keyof(chapters[chapterIndex].stages, currentStage)
  else
    chapterIndex = chapterIndex + 1
    stageIndex = 1
  end
  local result
  if stageIndex > 1 then
    result = GetOutputs(chapterIndex, stageIndex - 1)
  elseif chapterIndex > 1 then
    result = GetOutputs(chapterIndex - 1, #chapters[chapterIndex - 1].stages)
  else
    result = GetOutputs()
  end
  return result
end
local GetOutputsImprovedStage = function()
  chapterBuffer = chapterBuffer or {}
  table.clear(chapterBuffer)
  local chapters = GetChapters(chapterBuffer)
  local curOutputs = GetCurrentOutputs()
  local passedChapterIndex, passedStageIndex = GetPassedIndexes()
  local startStageIndex = passedStageIndex
  for i = passedChapterIndex, #chapters do
    local stages = chapters[i].stages
    for j = startStageIndex + 1, #stages do
      local result = GetOutputs(i, j)
      for _, v in ipairs(result) do
        local k = table.keyof(curOutputs, v.itemId, "itemId")
        if k and curOutputs[k].count < v.count then
          return stages[j], i, j
        end
      end
    end
    startStageIndex = 0
  end
end
return {
  CardIsUsedInUpgradeDungeon = CardIsUsedInUpgradeDungeon,
  GetChapters = GetChapters,
  GetOutputs = GetOutputs,
  GetCurrentOutputs = GetCurrentOutputs,
  GetPassedIndexes = GetPassedIndexes,
  GetOutputsImprovedStage = GetOutputsImprovedStage
}
