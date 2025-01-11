--!strict

-- Class implementing IEquatable<T>
local Equatable = {}
Equatable.__index = Equatable

type Equatable<T> = IEquatable<T> & {
    Value: T,
}

function Equatable.new<T>(value: T): Equatable<T>
    local self: Equatable<T> = setmetatable({
        Value = value,
    }, Equatable)
    return self
end

function Equatable:Equals(other: any)
  error("Not implemented")
end

return Equatable
