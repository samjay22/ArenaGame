--!strict
local Abstract = require(game.ReplicatedStorage.Types.Abstract)

type IBaseService<T> = {
    GetServiceName : () -> string,
    GetServiceType : () -> string,
} & T & Abstract.IComparable<T>

type IGetMethods = {
    GetEntityFromId : <E>(id : number) -> E   
}



--For Player
type DataService<T> = IBaseService<T> & IGetMethods
export type InventoryService = IBaseService<{}>
export type StatsService = IBaseService<{}>

--- services for dealing with in game assets
type IMetadataService<T> = IBaseService<T> & IGetMethods
export type CharacterMetadataService = IMetadataService<{}>
export type AbilityMetadataService = IMetadataService<{}>



return 0
