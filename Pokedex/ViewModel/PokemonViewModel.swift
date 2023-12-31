//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.
//

import Foundation
class PokemonViewModel {
  
    static func GetPokemon (paginacion: String,responseResult : @escaping(Pokemons?,Error?) -> Void) {
          
          let url = URL(string: "\(paginacion)")!
          URLSession.shared.dataTask(with: url) { data, response, error in
               let httpResponse = response as! HTTPURLResponse
              if httpResponse.statusCode == 200 {
                  if let dataSource = data{
                      let decoder = JSONDecoder()
                      let result =  try!
                      decoder.decode(Pokemons.self, from: dataSource)
                      responseResult(result,nil)
                  }
                  if let errorSource = error{
                      responseResult(nil,errorSource)
                  }
                  
              }else{
                  print("Error en la peticion get")
                  responseResult(nil,error)
              }
              
           
              
          }.resume()
          
          //  return result
      }
    static func GetByName (namePokemon: String,responseResult : @escaping(Pokemon?,Error?) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(namePokemon)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Pokemon.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
            }else{
                print("Error en la peticion get by name y id")
                
                responseResult(nil,error)
            }
        }.resume()
        
        //  return result
    }
    static func GetById (id: String,responseResult : @escaping(Pokemon?,Error?) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
             let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Pokemon.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
            }else{
                print("Error en la peticion de busqueda por ID")
                responseResult(nil,error)
            }
            
         
            
        }.resume()
        
        //  return result
    }
    static func GetByElemento (elemento: String,responseResult : @escaping(Tipos?,Error?) -> Void) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/type/\(elemento)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
             let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result =  try!
                    decoder.decode(Tipos.self, from: dataSource)
                    responseResult(result,nil)
                }
                if let errorSource = error{
                    responseResult(nil,errorSource)
                }
                
            }else{
                print("Error en la peticion de busqueda por elemento")
                responseResult(nil,error)
            }
            
           
            
        }.resume()
        
        //  return result
    }
}
