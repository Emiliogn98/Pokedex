//
//  DetailPokemonController.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 20/06/23.
//

import UIKit

class DetailPokemonController: UIViewController {
    
    
    @IBOutlet weak var lblNombre: UILabel!
    
    
    @IBOutlet weak var lblUrl: UILabel!
    
    
    
    @IBOutlet weak var lblId: UILabel!
    
    var pokemonName : String = ""
    var url : String = ""
    var id : String = ""
    var pokemon : [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        lblNombre.text = pokemonName
        
       
    }
    
    func updateUI(){
        PokemonViewModel.PokemonImage(namePokemon: self.pokemonName ) { result, error in
            DispatchQueue.main.async{
                if result.self != nil {
                    for objPokemon in result!.self.sprites{
                        var poke = objPokemon as! Pokemon
                        self.pokemon.append(poke)
                        print(self.pokemon)
                    }
                }
            }
        }

    }
    

}
