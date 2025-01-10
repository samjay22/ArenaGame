--!strict
local Services = require(game.ReplicatedStorage.Types.Services)
local Stucts = require(game.ReplicatedStorage.Types.Structs)

local InsertService : InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Structs = require(ReplicatedStorage.Types.Structs)

local Characters : {Structs.CharacterMetadata} = {}

local Service = {}

return Service