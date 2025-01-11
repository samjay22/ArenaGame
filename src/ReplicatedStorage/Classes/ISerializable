--!strict

-- Class implementing ISerializable
local Serializable = {}
Serializable.__index = Serializable

export type Serializable = ISerializable & typeof(Serializable)

function Serializable.new(): Serializable
    local self: Serializable = setmetatable({}, Serializable)
    return self
end

function Serializable:Serialize()
    error("Not implemented")
end

function Serializable:Deserialize(data: string)
  error("Not implemented")
end

return Serializable
