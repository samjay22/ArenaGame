local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Trove = require(ReplicatedStorage.Classes.Trove)
-- Variables
local ControlledExecution = {}

-- Utils
local function execute(thread: thread, skipAmount: number, trove: Trove.Trove, ...)
    while true do -- Yields handled with coroutine.yield instead of task library
        local success, output = coroutine.resume(thread, trove, ...)
        if not success then
            return false, warn(`Error with executing thread: {output}`)
        end

        if coroutine.status(thread) ~= "suspended" then
            return true, output
        end

        local deltaTime = output
        skipAmount -= deltaTime
        if skipAmount < 0 then
            deltaTime = task.wait(-skipAmount)
            skipAmount = 0

        end

    end

end

-- Skippable execution
function ControlledExecution.createExecution(thread: thread)
    local ongoingExecution = nil
    local trove = Trove.new()
    
    local function execution(skipAmount: number, ...): (boolean, any)
        skipAmount = skipAmount or 0
        local thread = coroutine.running()

        ongoingExecution = task.spawn(function(...)
            local success, output = execute(thread, skipAmount, trove, ...)
            if not success then
                trove:Destroy()
            end

            coroutine.resume(thread, success, output)

        end, ...)

        return coroutine.yield()

    end

    return {
        getOngoingExecution = function()
            return ongoingExecution
        end,
        mainThread = thread,
        execute = execution,
        trove = trove,

    }
    
end
export type Execution = typeof(ControlledExecution.createExecution(nil :: any))

function ControlledExecution.cancelExecution(execution: Execution)
    task.cancel(execution.mainThread)
    execution.trove:Destroy()

end


return ControlledExecution