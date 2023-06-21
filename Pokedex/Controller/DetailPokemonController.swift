//
//  DetailPokemonController.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 20/06/23.
//

import UIKit

class DetailPokemonController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var lblNombre: UILabel!
    
    
    @IBOutlet weak var lblStats: UILabel!
    
    @IBOutlet weak var lblImagenShiny: UILabel!
    
    @IBOutlet weak var lblImagenFrontal: UILabel!
    
    @IBOutlet weak var lblId: UILabel!
    
    var pokemonName : String = ""
    var url : String = ""
    var id : String = ""
    var pokemon : [Pokemon] = []
    var pokemonStats : [Stats] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
        
    }
    
    func updateUI(){
        var pokemon = Pokemon()
        
        
        PokemonViewModel.GetByName(namePokemon: self.pokemonName ) { result, error in
            DispatchQueue.main.async{
                if result! != nil {
                    var pokemon = Pokemon()
                    pokemon.id = result?.id
                    pokemon.name = result?.name
                    self.lblNombre.text = result?.name
                    pokemon.height = result?.height
                    pokemon.weight = result?.weight
                    //                    pokemon.sprites?.front_shiny = result?.sprites?.front_shiny
                    //                    self.lblImagenShiny.text = result?.sprites?.front_shiny
                    //                    pokemon.sprites?.front_shiny = result?.sprites?.front_default
                    //                    self.lblImagenFrontal.text = result?.sprites?.front_default
                    
                    let imageURLString = "\(result!.sprites!.front_default!)"
                    UIImage.loadImageFromURL(imageURLString) { (image) in
                        if let image = image {
                            // La imagen se cargó exitosamente desde la URL
                            self.imageView.image = image
                            //  print(image)
                            //   print("la imagen se cargo correcramente")
                            
                        } else {
                            print("error al cargar la imagen")
                        }
                        
                        for objPokemon in result!.stats!{
                            self.pokemonStats.append(objPokemon)
                        }
                        
                        //print(self.pokemonStats)
                        self.lblStats.text = "\(self.pokemonStats[0].stat!.name!) \(self.pokemonStats[0].base_stat!)"
                        
                    }
                }
            }
        }
        
    }
}


// MARK: UIImage

extension UIImage {
func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
guard let url = URL(string: urlString) else {
completion(nil)
return
}

URLSession.shared.dataTask(with: url) { (data, response, error) in
guard let data = data, let image = UIImage(data: data) else {
completion(nil)
return
}

DispatchQueue.main.async {
completion(image)
}
}.resume()
}
}

    


