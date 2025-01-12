-- Variables
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ControlledExecution = require(ReplicatedStorage.Utilities.ControlledExecution)

local abilityCache = {}
local executionCache = {}

local Abilities = {}

-- Abilities
function Abilities.load(folder: Instance)
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

    return function(...)
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


return abilityCache