local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Trove = require(ReplicatedStorage.Classes.Trove)
-- Variables
local ControlledExecution = {}

-- Skippable execution
function ControlledExecution.createExecution(thread: thread)
    local ongoingExecution = nil
    local trove = Trove.new()
    local state
    local _skipAmount = 0
    
    local function execute(thread: thread, state: Execution, ...)
        while true do -- Yields handled with coroutine.yield instead of task library
            local success, output = coroutine.resume(thread, state, ...)
            if not success then
                return false, warn(`Error with executing thread: {output}`)
            end

            if coroutine.status(thread) ~= "suspended" then
                return true, output
            end

            local deltaTime = output
            _skipAmount -= deltaTime
            if _skipAmount < 0 then
                deltaTime = task.wait(-_skipAmount)
                _skipAmount = 0

            end

        end

    end
    
    local function execution(skipAmount: number, ...): (boolean, any)
        _skipAmount = skipAmount or 0
        local thread = coroutine.running()

        ongoingExecution = task.spawn(function(...)
            local success, output = execute(thread, state, ...)
            if not success then
                trove:Destroy()
            end

            coroutine.resume(thread, success, output)

        end, ...)

        return coroutine.yield()

    end
    
    state = {
        getOngoingExecution = function()
            return ongoingExecution
        end,
        skip = function(amount: number)
            _skipAmount += amount
        end,
        mainThread = thread,
        execute = execution,
        trove = trove,
        communicated = {},

    }

    return state
    
end
export type Execution = typeof(ControlledExecution.createExecution(nil :: any))

function ControlledExecution.cancelExecution(execution: Execution)
    task.cancel(execution.mainThread)
    execution.trove:Destroy()

end


return ControlledExecution