--!strict
local Channels : {[string] : BindableEvent}
local Channel = {}

function Channel.AsyncSub(name : string, delegate : (...any) -> ()) : RBXScriptConnection
    local event : BindableEvent? = Channels[name]
    assert(event, `No event under name {name}`)

    return event.Event:Connect(delegate)
end

function Channel.SyncSub(name : string) : (...any)
    local event : BindableEvent? = Channels[name]
    assert(event, `No event under name {name}`)

    return event.Event:Wait()
end

function Channel.Pub(name : string, data : any) : nil
    local event : BindableEvent? = Channels[name]
    assert(event, `No event under name {name}`)

    event:Fire(data)
    return nil
end

return Channel