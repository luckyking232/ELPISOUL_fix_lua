require("Create")
local VertexPath = Create("VertexPath")
EndOfPathInstruction = {
  LOOP = "LOOP",
  REVERSE = "REVERSE",
  STOP = "STOP"
}
local Clamp01 = function(val)
  return math.min(1, math.max(0, val))
end
local CalculatePercentOnPathData = function(self, t, endOfPathInstruction)
  if endOfPathInstruction == EndOfPathInstruction.LOOP then
    if t < 0 then
      t = t + math.ceil(math.abs(t))
    end
    t = t % 1
  elseif endOfPathInstruction == EndOfPathInstruction.REVERSE then
    local length = 1
    local val = math.min(2 * length, math.max(0, t - math.floor(t / (2 * length)) * (2 * length)))
    t = length - math.abs(val - length)
  elseif endOfPathInstruction == EndOfPathInstruction.STOP then
    t = Clamp01(t)
  end
  local prevIndex = 1
  local numPoints = self:GetNumPoints()
  local nextIndex = numPoints
  local i = t * (numPoints - 1) + 1
  local _, fracPart = math.modf(i)
  if fracPart > 0.5 then
    i = math.ceil(i)
  else
    i = math.floor(i)
  end
  while true do
    if t < self.times[i] then
      nextIndex = i
    else
      prevIndex = i
    end
    i = math.ceil((nextIndex + prevIndex) / 2)
    if nextIndex - prevIndex <= 1 then
      break
    end
  end
  local a, b = self.times[prevIndex], self.times[nextIndex]
  local abPercent
  if a ~= b then
    abPercent = Clamp01((t - a) / (b - a))
  else
    abPercent = 0
  end
  return prevIndex, nextIndex, abPercent
end
local ClosestPointOnLineSegment = function(p, a, b)
  local aB, aP = b - a, p - a
  local sqrLenAB = aB.sqrMagnitude
  if 0 == sqrLenAB then
    return a
  end
  local t = Clamp01(Vector3.Dot(aP, aB) / sqrLenAB)
  return a + aB * t
end
local Lerp = function(a, b, t)
  return a + (b - a) * Clamp01(t)
end
local CalculateClosestPointOnPathData = function(self, localPoint)
  local minSqrDst = math.huge
  local closestPoint = Vector3.zero
  local closestSegmentIndexA = 1
  local closestSegmentIndexB = 1
  local length = self:GetNumPoints()
  for i = 1, length do
    local nextI = i + 1
    if length < nextI then
      break
    end
    local closestPointOnSegment = ClosestPointOnLineSegment(localPoint, self.localPoints[i], self.localPoints[nextI])
    local sqrDst = (localPoint - closestPointOnSegment).sqrMagnitude
    if minSqrDst > sqrDst then
      minSqrDst = sqrDst
      closestPoint = closestPointOnSegment
      closestSegmentIndexA = i
      closestSegmentIndexB = nextI
    end
  end
  local closestSegmentLength = (self.localPoints[closestSegmentIndexA] - self.localPoints[closestSegmentIndexB]).magnitude
  local t = (closestPoint - self.localPoints[closestSegmentIndexA]).magnitude / closestSegmentLength
  return closestSegmentIndexA, closestSegmentIndexB, t
end

function VertexPath:__ctor(transform, bytes)
  local stream = CS.ReadWriteStream(bytes)
  self.length = stream:ReadSingle()
  local pointsLength = stream:ReadInt32()
  self.localPoints = {}
  for _ = 1, pointsLength do
    table.insert(self.localPoints, stream:ReadVector3())
  end
  self.localTangents = {}
  local tangentsLength = stream:ReadInt32()
  for _ = 1, tangentsLength do
    table.insert(self.localTangents, stream:ReadVector3())
  end
  local timesLength = stream:ReadInt32()
  self.times = {}
  for _ = 1, timesLength do
    table.insert(self.times, stream:ReadSingle())
  end
  local cumulativeLengthAtEachVertexLength = stream:ReadInt32()
  self.cumulativeLengthAtEachVertex = {}
  for _ = 1, cumulativeLengthAtEachVertexLength do
    table.insert(self.cumulativeLengthAtEachVertex, stream:ReadSingle())
  end
  self.transform = transform
end

function VertexPath:__delete()
  self.length = nil
  self.transform = nil
  self.times = nil
  self.localPoints = nil
  self.localTangents = nil
  self.cumulativeLengthAtEachVertex = nil
end

function VertexPath:GetPointAtTime(t, endOfPathInstruction)
  local previousIndex, nextIndex, percentBetweenIndices = CalculatePercentOnPathData(self, t, endOfPathInstruction)
  return Vector3.Lerp(self:GetPoint(previousIndex), self:GetPoint(nextIndex), percentBetweenIndices)
end

function VertexPath:GetDirectionAtTime(t, endOfPathInstruction)
  local previousIndex, nextIndex, percentBetweenIndices = CalculatePercentOnPathData(self, t, endOfPathInstruction)
  local dir = Vector3.Lerp(self.localTangents[previousIndex], self.localTangents[nextIndex], percentBetweenIndices)
  return self.transform:TransformDirection(dir)
end

function VertexPath:GetPoint(index)
  local point = self.localPoints[index]
  return self.transform:TransformPoint(point)
end

function VertexPath:GetPointAtDistance(dst, endOfPathInstruction)
  endOfPathInstruction = endOfPathInstruction or EndOfPathInstruction.LOOP
  local t = dst / self.length
  return self:GetPointAtTime(t, endOfPathInstruction)
end

function VertexPath:GetDirectionAtDistance(dst, endOfPathInstruction)
  endOfPathInstruction = endOfPathInstruction or EndOfPathInstruction.LOOP
  local t = dst / self.length
  return self:GetDirectionAtTime(t, endOfPathInstruction)
end

function VertexPath:GetClosestPointOnPath(worldPoint)
  local localPoint = self.transform:InverseTransformPoint(worldPoint)
  local previousIndex, nextIndex, percentBetweenIndices = CalculateClosestPointOnPathData(self, localPoint)
  local localResult = Vector3.Lerp(self.localPoints[previousIndex], self.localPoints[nextIndex], percentBetweenIndices)
  return self.transform:TransformPoint(localResult)
end

function VertexPath:GetClosestDistanceAlongPath(worldPoint)
  local localPoint = self.transform:InverseTransformPoint(worldPoint)
  local previousIndex, nextIndex, percentBetweenIndices = CalculateClosestPointOnPathData(self, localPoint)
  return Lerp(self.cumulativeLengthAtEachVertex[previousIndex], self.cumulativeLengthAtEachVertex[nextIndex], percentBetweenIndices)
end

function VertexPath:GetNumPoints()
  local t_localPoints = type(self.localPoints)
  if "table" == t_localPoints then
    return #self.localPoints
  elseif "userdata" == t_localPoints then
    return self.localPoints.Length
  end
end

function VertexPath:DrawGizmos()
  local numPoints = self:GetNumPoints()
  for i = 1, numPoints do
    local nextI = i + 1
    if numPoints < nextI then
      break
    end
    Debug.DrawLine(self:GetPoint(i), self:GetPoint(nextI), Color.red)
  end
end

return VertexPath
