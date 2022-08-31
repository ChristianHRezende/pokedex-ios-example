//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/08/22.
//

import Foundation

class PokemonService{
    
    var pokemonsDTO:[URLInfoObjectResponse] = []
    
    public func fetchPokemons(completionHandler:@escaping (Pokemon)-> Void){
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=20") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("Error on try get pokemons")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                    print("Error on try get response")
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    
                    do {
                        let jsonPokemons = try decoder.decode(PokemonsResponseDTO.self, from: data)
                        self.pokemonsDTO = jsonPokemons.results
                        self.pokemonsDTO.forEach { pokemonDTO in
                            self.fetchPokemon(pokemonDTO.url,completionHandler: completionHandler)
                        }
                        
                    } catch let error {
                        print("Error on try get jsonPokemons",error.localizedDescription)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    
    private func fetchPokemon(_ url:String,completionHandler:@escaping (Pokemon)-> Void){
        if let url = URL(string: url){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Some error on trying get pokemon data")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                    print("Some error on trying get pokemon data http response")
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    do {
                        let pokemonJson = try decoder.decode(PokemonDetailResponseDTO.self, from: data)
                        let pokemonDetailDTO:PokemonDetailResponseDTO = pokemonJson
                        let pokemon = Pokemon(pokemonDTO: pokemonDetailDTO)
                        completionHandler(pokemon)
                        
                    } catch let error {
                        print("Error on try get jsonPokemon",error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
}
