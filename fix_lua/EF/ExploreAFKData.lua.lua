local level, exp, groups, tempGroupCards
local AddOrOverrideGroupInfo = function(groupInfo)
  groups = groups or {}
  local k = table.keyof(groups, groupInfo.groupId, "groupId")
  if not k then
    table.insert(groups, groupInfo)
  else
    groups[k] = groupInfo
  end
end
local GetAllGroupsInfo = function()
  return groups
end
local GetGroupInfo = function(groupId)
  if not groups then
    return
  end
  local k = table.keyof(groups, groupId, "groupId")
  if k then
    return groups[k]
  end
end
local GetGroupIndex = function(groupId)
  if not groups then
    return
  end
  local k = table.keyof(groups, groupId, "groupId")
  return k
end
local SetExp = function(val)
  exp = val
end
local GetExp = function()
  return exp or 0
end
local SetLevel = function(val)
  level = val
end
local GetLevel = function()
  return level or 1
end
local DropTempGroupCards = function()
  if tempGroupCards then
    local str = Json.encode(tempGroupCards)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.EXPLORE_AFK_TEMP_GROUP_CARDS, str)
  end
end
local InitTempGroupCards = function()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.EXPLORE_AFK_TEMP_GROUP_CARDS, "")
  if string.isEmptyOrNil(str) then
    tempGroupCards = {}
  else
    tempGroupCards = Json.decode(str)
  end
end
local AddOrOverrideCardToTempGroup = function(groupId, cardId, index)
  tempGroupCards = tempGroupCards or {}
  for _, entry in pairs(tempGroupCards) do
    local gid = entry.groupId
    local cardEntries = entry.cardEntries
    if gid ~= groupId then
      for k = #cardEntries, 1, -1 do
        local cardEntry = cardEntries[k]
        if cardEntry.cardId == cardId then
          table.remove(cardEntries, k)
        end
      end
    end
  end
  local cardEntries
  local key = table.keyof(tempGroupCards, groupId, "groupId")
  if not key then
    local groupCardEntries = {
      groupId = groupId,
      cardEntries = {}
    }
    cardEntries = groupCardEntries.cardEntries
    table.insert(tempGroupCards, groupCardEntries)
  else
    cardEntries = tempGroupCards[key].cardEntries
  end
  key = table.keyof(cardEntries, index, "index")
  if not key then
    table.insert(cardEntries, {cardId = cardId, index = index})
  else
    cardEntries[key].cardId = cardId
  end
  table.sort(cardEntries, function(x, y)
    return x.index < y.index
  end)
  DropTempGroupCards()
end
local GetTempGroupCards = function(groupId)
  if tempGroupCards then
    local key = table.keyof(tempGroupCards, groupId, "groupId")
    if key then
      return tempGroupCards[key].cardEntries
    end
  end
end
local GetTempGroupCard = function(groupId, index)
  local cardEntries = GetTempGroupCards(groupId)
  if cardEntries then
    local k = table.keyof(cardEntries, index, "index")
    if k then
      return cardEntries[k].cardId
    end
  end
end
local GetAllTempGroupCards = function()
  return tempGroupCards
end
local LEVEL_OFFSET_IN_TBL = 70074000
local GetLevelExpThreshold = function(level)
  local expTbl = TableData.GetTable("BaseDispatchLevel")
  for i, v in pairs(expTbl) do
    if i == LEVEL_OFFSET_IN_TBL + level then
      return v.next_exp
    end
  end
  return math.huge
end
local GetMaxLevel = function()
  local result = -1
  local expTbl = TableData.GetTable("BaseDispatchLevel")
  for i, v in pairs(expTbl) do
    result = math.max(result, v.level)
  end
  return result
end
local ClearTempGroupCards = function(groupId)
  local cardEntries = GetTempGroupCards(groupId)
  if cardEntries then
    table.clear(cardEntries)
  end
end
local ClearAllTempGroupCards = function()
  if tempGroupCards then
    table.clear(tempGroupCards)
  end
end
local ClearAllGroupsInfo = function()
  if groups then
    table.clear(groups)
  end
end
local dispatchTeamConfigs
local GetDispatchTeamConfigs = function()
  if not dispatchTeamConfigs then
    local configs = {}
    local tbl = TableData.GetTable("BaseDispatchTeam")
    for i, v in pairs(tbl) do
      table.insert(configs, v)
    end
    table.sort(configs, function(x, y)
      return x.id < y.id
    end)
    dispatchTeamConfigs = configs
  end
  return dispatchTeamConfigs
end
return {
  AddOrOverrideGroupInfo = AddOrOverrideGroupInfo,
  GetAllGroupsInfo = GetAllGroupsInfo,
  GetGroupInfo = GetGroupInfo,
  GetGroupIndex = GetGroupIndex,
  SetExp = SetExp,
  SetLevel = SetLevel,
  GetExp = GetExp,
  GetLevel = GetLevel,
  InitTempGroupCards = InitTempGroupCards,
  DropTempGroupCards = DropTempGroupCards,
  AddOrOverrideCardToTempGroup = AddOrOverrideCardToTempGroup,
  GetTempGroupCards = GetTempGroupCards,
  GetTempGroupCard = GetTempGroupCard,
  GetAllTempGroupCards = GetAllTempGroupCards,
  GetLevelExpThreshold = GetLevelExpThreshold,
  GetMaxLevel = GetMaxLevel,
  ClearTempGroupCards = ClearTempGroupCards,
  ClearAllTempGroupCards = ClearAllTempGroupCards,
  ClearAllGroupsInfo = ClearAllGroupsInfo,
  GetDispatchTeamConfigs = GetDispatchTeamConfigs
}
