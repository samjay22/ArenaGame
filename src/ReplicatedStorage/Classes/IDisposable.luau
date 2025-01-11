--!strict

-- Class implementing IDisposable
local Disposable = {}
Disposable.__index = Disposable

export type Disposable = IDisposable & typeof(Disposable)

function Disposable.new(): Disposable
    local self: Disposable = setmetatable({}, Disposable)
    return self
end

function Disposable:Dispose()
  error("Not implemented")
end

return Disposable
