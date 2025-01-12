-- Variables
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ControlledExecution = require(ReplicatedStorage.Utilities.ControlledExecution)

local abilityCache = {}
local awaitingSuspensions = {}
local executionCache = {}

local Abilities = {}

-- Abilities
function Abilities.load(folder: Instance) -- Prob not gonna use this, use define instead! LOL. LMAOOO!
    for _, Module in next, folder:GetDescendants() do
        if not Module:IsA("ModuleScript") then
            continue
        end
        if Module.Parent:IsA("ModuleScript") then
            continue
        end

        local Execution = require(Module)
        abilityCache[Module.Name] = Execution

    end

end

function Abilities.execute(player: Player, attackName: string, skipTime: number?)
    local execution = executionCache[attackName]
    assert(execution, `No execution for {attackName}`)

    local controlledExecution = ControlledExecution.createExecution(coroutine.create(execution))
    local guid = HttpService:GenerateGUID(false)
    executionCache[guid] = controlledExecution
    controlledExecution._guid = guid

    return controlledExecution, function(...)
        controlledExecution.execute(skipTime, ...)
        executionCache[guid] = nil

    end

end

function Abilities.cancel(guid: string)
    local controlledExecution = executionCache[guid]
    assert(controlledExecution, `No controlled execution for {guid}`)

    ControlledExecution.cancelExecution(controlledExecution)
    executionCache[guid] = nil

end

function Abilities.replicateInformation(guid: string, data: {})
    local controlledExecution = executionCache[guid]
    assert(controlledExecution, `No controlled execution for {guid}`)

    for k, v in next, data do
        controlledExecution.communicated[k] = v
    end

    local thread = awaitingSuspensions[guid]
    if thread then
        coroutine.resume(thread)
    end

end

function Abilities.define(execution: (player: Player, state: ControlledExecution.Execution, ...any)->())
    return function(name: string)
        abilityCache[name] = execution
    end

end

function Abilities.awaitReplication(state: ControlledExecution.Execution, awaitingKey: any?)
    local now = os.clock()
    local guid = state._guid :: string
    local thread = coroutine.running()

    awaitingSuspensions[guid] = thread
    
    if awaitingKey then
        while state.communicated[awaitingKey] == nil do
            coroutine.yield()
        end

    else
        coroutine.yield()
    end

    awaitingSuspensions[guid] = nil
    state.skip(os.clock() - now)

end


return Abilities