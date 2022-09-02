//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/08/22.
//

import Foundation

class Pokemon {
    var name:String?
    var image:URL?
    var id:Int?
    var order:Int?
    
    init(pokemonDTO:PokemonDetailResponseDTO) {
        self.name = pokemonDTO.name
        if let urlImage = URL(string:pokemonDTO.sprites.frontDefault){
            self.image  = urlImage
        }else {
            self.image = nil
        }
        self.id = pokemonDTO.id
        self.order = pokemonDTO.order
    }
}
