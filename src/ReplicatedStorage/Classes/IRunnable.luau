--!strict

-- Class implementing IRunnable
local Runnable = {}
Runnable.__index = Runnable

export type Runnable = IRunnable & {
    _isRunning: boolean,
}

function Runnable.new(): Runnable
    local self: Runnable = setmetatable({
        _isRunning = false,
    }, Runnable)
    return self
end

function Runnable:Run()
  error("Not implemented")
end

function Runnable:Stop()
  error("Not implemented")
end

function Runnable:IsRunning()
    return self._isRunning
end

return Runnable
