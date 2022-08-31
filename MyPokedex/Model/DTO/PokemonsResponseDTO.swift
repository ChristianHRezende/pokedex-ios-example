//
//  PokemonsReponseDTO.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/08/22.
//

import Foundation

class PokemonsResponseDTO:Codable {
    var count: Int
    var next:String
    var previous:String
    var results:[URLInfoObjectResponse]

}
