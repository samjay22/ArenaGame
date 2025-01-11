--!strict

-- Class implementing IPersistable
local Persistable = {}
Persistable.__index = Persistable

export type Persistable = IPersistable & typeof(Persistable)

function Persistable.new(): Persistable
    local self: Persistable = setmetatable({}, Persistable)
    return self
end

function Persistable:Save()
  error("Not implemented")
end

function Persistable:Load()
    error("Not implemented")
end

return Persistable
