//
//  Pokemons.swift
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.
//

import Foundation

struct Pokemons: Codable {

  var count    : Int?       = nil
  var next     : String?    = nil
  var previous : String?    = nil
  var results  : [Results]? = []


  init() {

  }

}

struct Results: Codable {
    
    var name : String? = nil
    var url  : String? = nil
    
    init() {

    }

}
