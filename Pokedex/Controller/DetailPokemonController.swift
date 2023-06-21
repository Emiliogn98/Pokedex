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
    
    @IBOutlet weak var lblStats1: UILabel!
    
    @IBOutlet weak var lblStats2: UILabel!
    
    @IBOutlet weak var lblStats3: UILabel!
    
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
                    pokemon.height = result?.height
                    pokemon.weight = result?.weight
                    pokemon.sprites?.front_shiny = result?.sprites?.front_shiny
                    pokemon.sprites?.front_shiny = result?.sprites?.front_default
                    
                    
                    for objPoke in result!.stats!{
                        let pokeStat = objPoke as Stats
                        self.pokemonStats.append(pokeStat)
                    }
                    //info
                    
                    //                    self.lblStats.text = "\(self.pokemonStats[0].stat!.name!) \(self.pokemonStats[0].base_stat)"
                    //                    self.lblNombre.text! =  String(self.pokemon[0].id!)
                    //                    self.lblImagenShiny.text = self.pokemon[0].sprites!.front_shiny!
                    //                    self.lblImagenFrontal.text = self.pokemon[0].sprites!.front_default!
                    //                    //self.lblStats.text = self.pokemon[0].stats.
                    //                    let imageURLString = "\(self.pokemon[0].sprites!.front_default!)"
                    //                    UIImage.loadImageFromURL(imageURLString) { (image) in
                    //                        if let image = image {
                    //                            // La imagen se cargó exitosamente desde la URL
                    //                            self.imageView.image = image
                    //                            //  print(image)
                    //                            //   print("la imagen se cargo correcramente")
                    //
                    //                        } else {
                    //                            print("error al cargar la imagen")
                    //                        }
                    // Info error indexpath
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
                        self.lblNombre.text = result?.name
                        self.lblStats.text = "\(self.pokemonStats[0].stat!.name!) \(self.pokemonStats[0].base_stat!)"
                        self.lblStats1.text = "\(self.pokemonStats[1].stat!.name!) \(self.pokemonStats[0].base_stat!)"
                        self.lblStats2.text = "\(self.pokemonStats[2].stat!.name!) \(self.pokemonStats[0].base_stat!)"
                        self.lblStats3.text = "\(self.pokemonStats[3].stat!.name!) \(self.pokemonStats[0].base_stat!)"
                        
                        
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

    


