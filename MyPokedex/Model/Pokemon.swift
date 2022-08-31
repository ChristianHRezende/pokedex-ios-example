//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/08/22.
//

import Foundation

class Pokemon {
    var name:String?
    var image:String?
    var id:Int?
    
    init(pokemonDTO:PokemonDetailResponseDTO) {
        self.name = pokemonDTO.name
        self.image = pokemonDTO.sprites.frontDefault
        self.id = pokemonDTO.id
    }
}
