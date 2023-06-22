//
//  DetailPokemonController.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 20/06/23.
//

import UIKit

class DetailPokemonController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageViewShiny: UIImageView!
    
    @IBOutlet weak var ColorFondo: UIStackView!
    
    
    @IBOutlet weak var stackViewInfo: UIStackView!
    
    @IBOutlet weak var lblTypes: UILabel!
    
    
    @IBOutlet weak var btnTiposOutlet: UIButton!
    @IBOutlet weak var fondoImagenes: UIStackView!
    @IBOutlet weak var lblNombre: UILabel!
    
    
    @IBOutlet weak var lblStats: UILabel!
    
    @IBOutlet weak var lblStats1: UILabel!
    
    @IBOutlet weak var lblStats2: UILabel!
    
    @IBOutlet weak var lblStats3: UILabel!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var imageHeart: UIImageView!
    
    @IBOutlet weak var imageDefense: UIImageView!
    
    @IBOutlet weak var imageType: UIImageView!
    
    @IBOutlet weak var imageSword: UIImageView!
    
    
    var pokemonName : String = ""
    var url : String = ""
    var id : String = ""
    var pokemon : [Pokemon] = []
    var pokemonStats : [Stats] = []
    var pokemonTypes : [Types] = []
    let colors: [String: UIColor] = ["normal": UIColor(named: "normal")!, "water": UIColor(named: "water")!,"fire": UIColor(named: "fire")!,
                                     "grass": UIColor(named: "grass")!, "ground": UIColor(named: "ground")!, "rock": UIColor(named: "rock")!, "poison": UIColor(named: "poison")!, "psychic": UIColor(named: "psychic")!, "electric": UIColor(named: "electric")!, "ghost": UIColor(named: "ghost")!, "fighting": UIColor(named: "fighting")!, "bug": UIColor(named: "bug")!, "ice": UIColor(named: "ice")!,"dark": UIColor(named: "dark")!,"steel": UIColor(named: "steel")!, "dragon": UIColor(named: "dragon")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
        view2.layer.cornerRadius = 10
        view2.layer.masksToBounds = true
        ColorFondo.layer.cornerRadius = 10
        ColorFondo.layer.masksToBounds = true
        lblTypes.layer.cornerRadius = 10
        lblTypes.layer.masksToBounds = true
        fondoImagenes.layer.cornerRadius = 40
        fondoImagenes.layer.masksToBounds = true
        
        
        
    }
    
    
    @IBAction func btnTipos(_ sender: UIButton) {
        
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
                    
                    for objPoke in result!.types!{
                        let pokeType = objPoke as! Types
                        self.pokemonTypes.append(pokeType)
                    }
                    
                    let imageURLString = "\(result!.sprites!.front_default!)"
                    UIImage.loadImageFromURL(imageURLString) { [self] (image) in
                        if let image = image {
                            // La imagen se cargó exitosamente desde la URL
                            self.imageView.image = image
                            //  print(image)
                            //   print("la imagen se cargo correcramente")
                            
                        } else {
                            print("error al cargar la imagen")
                        }
                        let imageURLString = "\(result!.sprites!.front_shiny!)"
                        UIImage.loadImageFromURL(imageURLString) { [self] (image) in
                            if let image = image {
                                // La imagen se cargó exitosamente desde la URL
                                   self.imageViewShiny.image = image
                                //  print(image)
                                //   print("la imagen se cargo correcramente")
                                
                            } else {
                                print("error al cargar la imagen")
                            }
                            self.lblNombre.text = result?.name
                            self.lblStats.text = "\(self.pokemonStats[0].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                            self.lblStats1.text = "\(self.pokemonStats[1].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                            self.lblStats2.text = "\(self.pokemonStats[2].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                            self.lblStats3.text = "\(self.pokemonStats[3].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                            self.lblTypes.text = "Tipo: \(self.pokemonTypes[0].type!.name!)"
                            if let color = colors[self.pokemonTypes[0].type!.name!]{
                                DispatchQueue.main.async {
                                    self.ColorFondo.backgroundColor = color
                                    self.view.backgroundColor = color
                                    self.lblTypes.backgroundColor = color
                                    self.fondoImagenes.backgroundColor = color
                                }
                            }
                            
                            
                        }
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

    


