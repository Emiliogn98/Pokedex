//
//  GetPokemonController.swift
//
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.

import UIKit

class GetPokemonController: UIViewController {
    var pokemonsList : [Results] = []
    var pokemonImagen : [Pokemon] = []
    var pokemonName : String = ""
    var text : String = ""
    var maxLenght = 2
    
    //Outlet
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        updateUI()
    }
    //Action
    func updateUI(){
        collectionView.reloadData()
        PokemonViewModel.GetPokemon { result, error in
            DispatchQueue.main.async {
            if result!.self != nil {
                   
                for objPokemon in result.self!.results!{
                        self.pokemonsList.append(objPokemon)
                       //self.pokemons
                        //print(self.pokemonsList)
                    }
               
                self.collectionView.reloadData()
                }
            }
        }
    }
//    func GetImage(){
//        PokemonViewModel.PokemonImage(namePokemon: self.pokemonName ) { result, error in
//            DispatchQueue.main.async{
//                if result.self != nil {
//                    for objPokemon in result!.self.sprites{
//                        let poke = objPokemon as! Pokemon
//                        self.pokemonImagen.append(poke)
//                    }
//                }
//            }
//        }
//
//    }
    

}

// MARK: CollectionViewDelegate,DataSource

extension GetPokemonController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
               
       
        cell.lblNombre.text = pokemonsList[indexPath.row].name
        self.pokemonName = pokemonsList[indexPath.row].name!
        cell.lblText.text = pokemonsList[indexPath.row].url
        self.text = pokemonsList[indexPath.row].url!
        
        
        var extratedSuffix = self.text.suffix(self.maxLenght)
        
        
        
     
        
               
        let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(extratedSuffix).png"
  //      let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
        UIImage.loadImageFromURL(imageURLString) { (image) in
        if let image = image {
        // La imagen se cargó exitosamente desde la URL
            cell.imagenView.image = image
            print(image)
            print("la imagen se cargo correcramente")
        } else {
            print("error al cargar la imagen")
        }
        }
     
         
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        return self.pokemonsList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      //  self.IdCoctel = Int(self.categoria[indexPath.row].idDrink!)!
       // self.performSegue(withIdentifier: "DrinkDetailSegue", sender: self)
        
    }
  
    
}

// MARK: UIImage

extension UIImage {
static func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
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
