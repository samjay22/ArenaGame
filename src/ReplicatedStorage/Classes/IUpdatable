--!strict

-- Interface for updatable entities
type IUpdatable = {
    Update: (self: IUpdatable, dt: number) -> (),
}

-- Class implementing IUpdatable
local Updatable = {}
Updatable.__index = Updatable

export type Updatable = IUpdatable & typeof(Updatable)

function Updatable.new(updateMethod : (self, dt : number) -> ()): Updatable
    local self: Updatable = setmetatable({}, Updatable)
    self.Update = updateMethod
    return self
end

function Updatable:Update(dt: number)
  error("Not implemented")
end

return Updatable
