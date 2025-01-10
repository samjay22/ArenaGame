--!strict
export type ServiceContainer = {
    GetService : <T>(name : string) -> T,
    AddService : (name : string, data : any) -> nil
}

local Services = {}
local Container = {}

function Container.GetService<T>(name : string) : T,
    assert(Services[name], `No service found with name {name}`)
    return Services[name]
end

function Container.AddService(name : string, data : any)
    assert(not Services[name], `Service {name} already exists`)
    Services[name] = data
end

return Container :: ServiceContainer