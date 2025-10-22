local NODE_CATEGORY = {
  UNVISITED = "UNVISITED",
  OPENED = "OPENED",
  CLOSED = "CLOSED"
}
local new_BinaryHeap = function(compareFunc)
  local BinaryHeap = {}
  BinaryHeap.__index = BinaryHeap
  
  function BinaryHeap:new()
    local obj = {
      m_array = {},
      m_lastIndex = 0,
      m_length = 0
    }
    setmetatable(obj, self)
    return obj
  end
  
  function BinaryHeap:insert(data)
    self.m_lastIndex = self.m_lastIndex + 1
    if self.m_length >= self.m_lastIndex then
      self.m_array[self.m_lastIndex] = data
    else
      table.insert(self.m_array, data)
      self.m_length = self.m_length + 1
    end
    if self.m_lastIndex > 1 then
      self:swimUp(self.m_lastIndex)
    end
  end
  
  function BinaryHeap:swimUp(index)
    local pindex = math.floor(index / 2)
    while pindex > 0 and self:compare(index, pindex) do
      self:swap(index, pindex)
      index = pindex
      pindex = math.floor(pindex / 2)
    end
  end
  
  function BinaryHeap:compare(n, m)
    local a = self.m_array[n]
    local b = self.m_array[m]
    if type(compareFunc) == "function" then
      return compareFunc(a, b)
    end
    return false
  end
  
  function BinaryHeap:swap(n, m)
    local temp = self.m_array[n]
    self.m_array[n] = self.m_array[m]
    self.m_array[m] = temp
  end
  
  function BinaryHeap:peek()
    return self.m_array[1]
  end
  
  function BinaryHeap:removeat(i)
    self:swap(i, self.m_lastIndex)
    local result = table.remove(self.m_array, self.m_lastIndex)
    self.m_lastIndex = self.m_lastIndex - 1
    self:sinkDown(i)
    return result
  end
  
  function BinaryHeap:pop()
    return self:removeat(1)
  end
  
  function BinaryHeap:sinkDown(index)
    local cindex = index * 2
    while cindex <= self.m_lastIndex do
      if cindex + 1 <= self.m_lastIndex and self:compare(cindex + 1, cindex) then
        cindex = cindex + 1
      end
      if self:compare(cindex, index) then
        self:swap(cindex, index)
        index = cindex
        cindex = cindex * 2
      else
        break
      end
    end
  end
  
  function BinaryHeap:remove(data)
    for i = 1, self.m_lastIndex do
      if self.m_array[i] == data then
        return true, self:removeat(i)
      end
    end
    return false
  end
  
  function BinaryHeap:foreach(onforeach, desc)
    if type(onforeach) == "function" then
      local len = self.m_lastIndex
      local startIndex, endIndex, step = desc and len or 1, desc and 1 or len, desc and -1 or 1
      for i = startIndex, endIndex, step do
        local breakout = onforeach(self.m_array[i])
        if breakout then
          break
        end
      end
    end
  end
  
  function BinaryHeap:reset()
    self.m_lastIndex = 0
  end
  
  return BinaryHeap:new()
end
local minCostFirst = function(n1, n2)
  return n1:totalCost() < n2:totalCost()
end
local new_node = function(obj)
  local Node = {}
  Node.__index = Node
  
  function Node:new(wrapper)
    local o = {
      category = NODE_CATEGORY.UNVISITED,
      cost = 0,
      estimate = 0,
      version = 0,
      wrapper = wrapper,
      parent = false
    }
    setmetatable(o, Node)
    return o
  end
  
  function Node:totalCost()
    return self.cost + self.estimate
  end
  
  return Node:new(obj)
end
local getOrCreateNode = function(self, wrapper)
  local node = self.wrapNodeLookup[wrapper]
  if not node then
    node = new_node(wrapper)
    self.wrapNodeLookup[wrapper] = node
  end
  if node.version ~= self.version then
    node.category = NODE_CATEGORY.UNVISITED
    node.parent = false
  end
  node.version = self.version
  return node
end
local pushOpenlist = function(self, node)
  self.openlist:insert(node)
  node.category = NODE_CATEGORY.OPENED
end
local initSearch = function(self, from, to)
  self.openlist:reset()
  self.version = (self.version or 0) + 1
  local node = getOrCreateNode(self, from)
  node.cost = 0
  node.estimate = self.estimateFunc(from, to)
  pushOpenlist(self, node)
end
local visitNeighbors = function(self, node, to)
  local neighbors = self.visitNeighborsFunc(node.wrapper)
  if neighbors then
    for _, neighbor in ipairs(neighbors) do
      local neighborNode = getOrCreateNode(self, neighbor)
      local push = false
      local cost = node.cost + self.getCostFunc(node.wrapper, neighbor)
      if neighborNode.category == NODE_CATEGORY.UNVISITED then
        push = true
      elseif cost <= neighborNode.cost then
        push = true
        if neighborNode.category == NODE_CATEGORY.OPENED then
          self.openlist:remove(neighborNode)
        end
      end
      if push then
        neighborNode.cost = cost
        neighborNode.estimate = self.estimateFunc(node.wrapper, to)
        neighborNode.parent = node
        pushOpenlist(self, neighborNode)
      end
    end
  end
end
local recall = function(node, resultBuffer)
  local cur = node
  while cur do
    resultBuffer = resultBuffer or {}
    table.insert(resultBuffer, cur.wrapper)
    cur = cur.parent
  end
  return resultBuffer
end
local new_pathfinder = function(estimate, equals, visit, getCost)
  local PathFinder = {}
  PathFinder.__index = PathFinder
  
  function PathFinder:new(estimateFunc, equalsFunc, visitNeighborsFunc, getCostFunc)
    local o = {
      openlist = new_BinaryHeap(minCostFirst),
      wrapNodeLookup = {},
      estimateFunc = estimateFunc,
      equalsFunc = equalsFunc,
      visitNeighborsFunc = visitNeighborsFunc,
      getCostFunc = getCostFunc
    }
    setmetatable(o, self)
    return o
  end
  
  function PathFinder:search(from, to, resultBuffer)
    initSearch(self, from, to)
    local founded = false
    local t = os.time()
    while true do
      local node = self.openlist:pop()
      if not node then
        break
      end
      node.category = NODE_CATEGORY.CLOSED
      if self.equalsFunc(node.wrapper, to) then
        founded = true
        resultBuffer = recall(node, resultBuffer)
        break
      end
      visitNeighbors(self, node, to)
    end
    return founded, resultBuffer
  end
  
  return PathFinder:new(estimate, equals, visit, getCost)
end
return {new = new_pathfinder}
