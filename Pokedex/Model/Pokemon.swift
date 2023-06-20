//
//  Pokemon.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 19/06/23.
//

import Foundation

struct Pokemon : Codable {
    //var sprites : Sprites? = Sprites()
    var sprites : [Sprites] = []
    var name : String? = nil
    var order : Int? = nil
}
struct Sprites : Codable {
    let back_default : String? = nil
    let back_shiny : String? = nil
}
