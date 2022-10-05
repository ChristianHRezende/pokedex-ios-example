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
    var types:[String]
    var weight:Double
    var height:Double
    var moves:[String]
    var stats: Dictionary<String,Int> = [:]
    
    init(pokemonDTO:PokemonDetailResponseDTO) {
        self.name = pokemonDTO.name
        self.id = pokemonDTO.id
        self.order = pokemonDTO.order
        self.weight = Double(pokemonDTO.weight)
        self.height = Double(pokemonDTO.height)/10
        
        if let urlImage = URL(string:pokemonDTO.sprites.frontDefault){
            self.image  = urlImage
        }else {
            self.image = nil
        }
        
        self.types = pokemonDTO.types.reduce([]) { partialResult, type in
            var newList = partialResult
            newList.append(type.type.name)
            return newList
        }
        
        let movesDTO:[MovesDTO] = pokemonDTO.moves.count > 2 ? Array(pokemonDTO.moves[0...1]) : pokemonDTO.moves
        
        self.moves = movesDTO.reduce([], { partialResult, move in
            var newList = partialResult
            newList.append(move.move.name)
            return newList
        })
        
        pokemonDTO.stats.forEach { statDTO in
            if let key = STATS_KEY[statDTO.stat.name] {
                let value = statDTO.baseStat
                self.stats[key] = value
            }
            
        }
    }
}
