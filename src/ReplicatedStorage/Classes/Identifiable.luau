--!strict

-- Identifiable interface
type Identifiable = {
    SystemId: string | number,
}

-- Class implementing Identifiable
local IdentifiableClass = {}
IdentifiableClass.__index = IdentifiableClass

export type IdentifiableClass = Identifiable & typeof(IdentifiableClass)

function IdentifiableClass.new(systemId: string | number): IdentifiableClass
    local self: IdentifiableClass = setmetatable({}, IdentifiableClass)
    self.SystemId = systemId
    return self
end

function IdentifiableClass:GetSystemId()
    return self.SystemId
end

return IdentifiableClass
