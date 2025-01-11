--!strict

-- Class implementing IUpdatable
local Updatable = {}
Updatable.__index = Updatable

export type Updatable = IUpdatable & typeof(Updatable)

function Updatable.new(): Updatable
    local self: Updatable = setmetatable({}, Updatable)
    return self
end

function Updatable:Update(dt: number)
  error("Not implemented")
end

return Updatable
