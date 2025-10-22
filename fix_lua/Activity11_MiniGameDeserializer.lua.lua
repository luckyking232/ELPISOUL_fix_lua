local DeserializeLevelConfigs = function(path)
  local bytes = ResourceManager.LoadTextAssetBytes(path)
  local stream = CS.ReadWriteStream(bytes)
  local configs = {}
  for i = 1, stream:ReadInt32() do
    local levelId = stream:ReadInt32()
    local shootNum = stream:ReadInt32()
    local maxRow = stream:ReadInt32()
    local maxCol = stream:ReadInt32()
    local balls = {}
    for _ = 1, stream:ReadInt32() do
      local row = stream:ReadInt32()
      local col = stream:ReadInt32()
      local color = stream:ReadInt32()
      local effect = stream:ReadInt32()
      table.insert(balls, {
        row = row,
        col = col,
        color = color,
        effect = effect
      })
    end
    local unlockDay = stream:ReadInt32()
    table.insert(configs, {
      id = levelId,
      shootNum = shootNum,
      maxRow = maxRow,
      maxCol = maxCol,
      unlockDay = unlockDay,
      balls = balls
    })
  end
  return configs
end
return {DeserializeLevelConfigs = DeserializeLevelConfigs}
