--!strict

-- Class implementing IComparable<T>
local Comparable = {}
Comparable.__index = Comparable

type Comparable<T> = IComparable<T> & {
    Value: T,
}

function Comparable.new<T>(value: T): Comparable<T>
    local self: Comparable<T> = setmetatable({
        Value = value,
    }, Comparable)
    return self
end

function Comparable:CompareTo(other: any)
  error("Not implemented")
end

return Comparable
