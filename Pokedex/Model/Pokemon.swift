//
//  Pokemon.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 19/06/23.
//

import Foundation

struct Pokemon : Codable {

    var height : Int? = nil
    var id : Int? = nil
    var name: String? = nil
    var order: Int? = nil
    var sprites : Sprites? = Sprites()
    var stats : [Stats]? = []
    var weight : Int? = nil
    var types : [Types]? = []
    
}
struct Sprites : Codable {
  
    var front_shiny : String? = nil
    var front_default : String? = nil

}

struct Stats : Codable {
   
    var base_stat : Int? = nil
    var stat : stat?
    
}
struct stat : Codable {
    var name : String?
    var url : String?
}
struct Types: Codable {

  var slot : Int?  = nil
  var type : Type? = Type()

  
  }
struct Type: Codable {

  var name : String? = nil
  var url  : String? = nil

  }


