-- BaseService.lua
local Abstract = require(game.ReplicatedStorage.Types.Abstract)

local BaseService = {}
BaseService.__index = BaseService
setmetatable(BaseService, {
    __index = Abstract, -- Inherit from Abstract
})

-- Constructor
function BaseService.new(serviceName: string, serviceType: string)
    local self = setmetatable({}, BaseService)
    self.serviceName = serviceName
    self.serviceType = serviceType
    return self
end

-- GetServiceName method
function BaseService:GetServiceName(): string
    return self.serviceName
end

-- GetServiceType method
function BaseService:GetServiceType(): string
    return self.serviceType
end

-- Implement Compare method from Abstract.IComparable
function BaseService:Compare(other: BaseService): boolean
    return self.serviceName == other.serviceName and self.serviceType == other.serviceType
end

return BaseService
