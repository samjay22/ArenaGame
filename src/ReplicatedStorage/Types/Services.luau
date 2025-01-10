--!strict
local Abstract = require(game.ReplicatedStorage.Types.Abstract)

type IBaseService<T> = {
    GetServiceName : () -> string,
    GetServiceType : () -> string,
} & T & Abstract.IComparable<T>

type IGetMethods = {
    GetEntityFromId : <E>(id : number) -> E   
}

--Interface for data(inventory, stats, ect...)
type IDataService<T> = IBaseService<{
    LoadData : (player : Player) -> (),
    SaveData : (player : Player) -> (),
    UpdateData : (player : Player) -> (),
}> & T & IGetMethods

--Interface for Asset based Services
type IMetadataService<T> = {
    UpdateEntityMetadataById : (id : number | string) -> (),
} & T & IGetMethods & Abstract.ILoadable

--For Player
export type InventoryService = IDataService<{

}>

export type StatsService = IDataService<{

}>

--- services for dealing with in game assets
export type CharacterMetadataService = IMetadataService<{

}>

export type AbilityMetadataService = IMetadataService<{

}>



return 0