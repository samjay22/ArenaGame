--!strict

-- Class implementing ICloneable<T>
local Cloneable = {}
Cloneable.__index = Cloneable

type Cloneable<T> = ICloneable<T> & {
    Value: T,
}

function Cloneable.new<T>(value: T): Cloneable<T>
    local self: Cloneable<T> = setmetatable({
        Value = value,
    }, Cloneable)
    return self
end

function Cloneable:Clone()
  error("Not Implemented")
end

return Cloneable
