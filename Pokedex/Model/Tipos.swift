//
//  Tipos.swift
//  Pokedex
//
//  Created by Emilio García Navarrete on 21/06/23.
//

import Foundation

struct Tipos: Codable {
var id : Int? = nil
var name : String? = nil
var pokemon : [pokemons]? = []
  }

struct pokemons: Codable {
    var name : String?
    var url : String?
}
