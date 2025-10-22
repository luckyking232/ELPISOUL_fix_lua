local base = Shape
local Circle = Create("Circle", base)

function Circle:__ctor(x, y, radius)
  self.shapeType = ShapeType.Circle
  self.x = x
  self.y = y
  self.radius = radius
  self.radiusSq = 0
  self.changed = false
end

function Circle:init()
  self.radiusSq = self.radius * self.radius
  self:initMassData()
  if not self.center then
    self.center = {
      self.x or 0,
      self.y or 0
    }
  end
  if self.x == nil then
    self.x = self.center[1]
  end
  if self.y == nil then
    self.y = self.center[2]
  end
  self.originalX = self.x
  self.originalY = self.y
  self:setAngle(self.angle or 0)
  self.last = {}
  self.aabb = {
    0,
    0,
    0,
    0
  }
  self:initLocalData()
end

function Circle:initLocalData()
  self.localCenter = {
    self.center[1] - self.x,
    self.center[2] - self.y
  }
end

function Circle:initMassData()
  self.density = self.density or 1
  self.area = math.pi * self.radiusSq
  self:setMass(self.mass)
  self.originalInertia = self.mass * self.radiusSq / 2
  self:setInertia(self.inertia ~= nil and self.inertia or self.originalInertia)
end

function Circle:translateCentroid(x, y)
  self.x = self.x + x
  self.y = self.y + y
  local localCenter = self.localCenter
  localCenter[1] = localCenter[1] - x
  localCenter[2] = localCenter[2] - y
end

function Circle:updateVertices()
  self:updateCenter()
  self:updateAABB()
end

function Circle:updateCenter()
  local ox, oy = self.localCenter[1], self.localCenter[2]
  if 0 ~= ox or 0 ~= oy then
    local x = ox * self.cos - oy * self.sin
    oy = ox * self.sin + oy * self.cos
    ox = x
  end
  self.center[1] = ox + self.x
  self.center[2] = oy + self.y
end

function Circle:update(timeStep)
  base.update(self, timeStep)
  self._updatedCount = self._updatedCount + 1
  self:setAngle(self.angle)
  if self.changed then
    self:updateCenter()
    self:updateAABB()
  end
  self.changed = false
end

function Circle:setAngle(angle)
  local oldVal = self.angle
  if oldVal ~= angle then
    self.changed = true
  end
  base.setAngle(self, angle)
end

function Circle:setPos(x, y)
  local oldX, oldY = self.x, self.y
  if oldX ~= x or oldY ~= y then
    self.changed = true
  end
  base.setPos(self, x, y)
end

function Circle:updateAABB()
  local b = self.radius + self.aabbExtension
  local x, y = self.center[1], self.center[2]
  self.aabb[1] = x - b
  self.aabb[2] = y - b
  self.aabb[3] = x + b
  self.aabb[4] = y + b
end

function Circle:containPoint(x, y)
  local dx = x - self.center[1]
  local dy = y - self.center[2]
  return dx * dx + dy * dy < self.radiusSq
end

return Circle
