--!strict

-- Class implementing ILoadable
local Loadable = {}
Loadable.__index = Loadable

export type Loadable = ILoadable & {
    _isLoaded: boolean,
}

function Loadable.new(): Loadable
    local self: Loadable = setmetatable({
        _isLoaded = false,
    }, Loadable)
    return self
end

function Loadable:Load()
  error("Not implemented")
end

function Loadable:Unload()
  error("Not implemented")
end

function Loadable:IsLoaded()
    return self._isLoaded
end

return Loadable
