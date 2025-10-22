Activity9_MiniGameGridsDataLoader = {}

function Activity9_MiniGameGridsDataLoader.Load(path)
  local bytes = ResourceManager.LoadTextAssetBytes(path)
  local stream = CS.ReadWriteStream(bytes)
  local length = stream:ReadInt32()
  local grids = {}
  for _ = 1, length do
    local coordinate = stream:ReadVector2Int()
    local centerPosition = stream:ReadVector3()
    local playerWalkable = stream:ReadBoolean()
    table.insert(grids, {
      coordinate = coordinate,
      centerPosition = centerPosition,
      playerWalkable = playerWalkable
    })
  end
  return grids
end

function Activity9_MiniGameGridsDataLoader.Transform(grids, mapRoot)
  local pixelsPerUnit = 100
  for _, grid in ipairs(grids) do
    local relativePosition = grid.centerPosition * pixelsPerUnit
    grid.uiPosition = Vector2(relativePosition.x + mapRoot.width * 0.5, mapRoot.height * 0.5 - relativePosition.y)
  end
end

local NewPoint = function(x, y, dis, parent)
  local point = {}
  point.x = x
  point.y = y
  point.distance = dis
  point.parent = parent
  return point
end
local CostFunction = function(point, point_end)
  local gx = point.distance
  local hx = math.abs(point.x - point_end.x) + math.abs(point.y - point_end.y)
  return gx + hx
end
local IsEqualPoint = function(point_a, point_b)
  return point_a.x == point_b.x and point_a.y == point_b.y
end
local ReverseTable = function(reverseTab)
  local tmp = {}
  for i = 1, #reverseTab do
    local key = #reverseTab + 1 - i
    tmp[i] = reverseTab[key]
  end
  return tmp
end
local GetIndex = function(x, y, cols)
  return (x - 1) * cols + y - 1
end
local direction = {
  {1, 0},
  {-1, 0},
  {0, 1},
  {0, -1}
}

function Activity9_MiniGameGridsDataLoader.GetPath(map, startPos, endPos)
  local point_start = NewPoint(startPos.x, startPos.y)
  local point_end = NewPoint(endPos.x, endPos.y)
  local rows = 26
  local cols = 26
  local point_start_index = GetIndex(point_start.x, point_start.y, cols)
  local open_list = {
    [point_start_index] = NewPoint(point_start.x, point_start.y, 0, nil)
  }
  local close_list = {}
  while next(open_list) do
    local neareast_point_index, neareast_point = next(open_list)
    local neareast_dis = CostFunction(neareast_point, point_end)
    for index, cur_point in pairs(open_list) do
      local dis = CostFunction(cur_point, point_end)
      if neareast_dis > dis then
        neareast_dis = dis
        neareast_point = cur_point
        neareast_point_index = index
      end
    end
    if IsEqualPoint(neareast_point, point_end) then
      local path = {}
      local point = neareast_point
      while nil ~= point do
        table.insert(path, point)
        point = point.parent
      end
      path = ReverseTable(path)
      return path
    end
    for _, dir in ipairs(direction) do
      local new_x = neareast_point.x + dir[1]
      local new_y = neareast_point.y + dir[2]
      if new_x >= 1 and rows >= new_x and new_y >= 1 and cols >= new_y then
        local new_point_index = GetIndex(new_x, new_y, cols)
        if not close_list[new_point_index] and map[new_x][new_y] then
          local new_dis = neareast_point.distance + 1
          if open_list[new_point_index] then
            if new_dis < open_list[new_point_index].distance then
              open_list[new_point_index].distance = new_dis
              open_list[new_point_index].parent = neareast_point
            end
          else
            open_list[new_point_index] = NewPoint(new_x, new_y, new_dis, neareast_point)
          end
        end
      end
    end
    open_list[neareast_point_index] = nil
    close_list[neareast_point_index] = neareast_point
  end
end
