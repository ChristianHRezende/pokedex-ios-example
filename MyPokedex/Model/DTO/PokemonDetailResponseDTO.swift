//
//  PokemonDetailResponseDTO.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/08/22.
//

import Foundation


class PokemonDetailResponseDTO:Codable {
    var abilities:[AbilitiesDTO]
    var moves:[MovesDTO]
    var name:String
    var sprites:SpriteDTO
    var weight:Int
    var id:Int
}

class AbilitiesDTO:Codable {
    var ability:URLInfoObjectResponse
}

class MovesDTO:Codable {
    var move:URLInfoObjectResponse
}

class SpriteDTO:Codable {
    var frontDefault:String
}
