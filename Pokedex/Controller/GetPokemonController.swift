//
//  GetPokemonController.swift
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.
//

import UIKit

class GetPokemonController: UIViewController {
    var pokemons : [Pokemons] = []
    
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
//        PokemonViewModel.GetCategoria { result, error in
//            DispatchQueue.main.async {
//                if result!.count != nil {
//                    for objPokemon in result!.results!{
//                        self.pokemons.append(objPokemon)
//                    }
//                    self.collectionView.reloadData()
//                }
//            }
//        }
    }
    
    
    

  

}

// MARK: CollectionViewDelegate,DataSource

extension GetPokemonController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
               
//        let imageURLString = pokemons[indexPath.row].strDrinkThumb
//        UIImage.loadImageFromURL(imageURLString!) { (image) in
//        if let image = image {
//        // La imagen se cargó exitosamente desde la URL
//            cell.imageView.image = image
//        } else {
//            print("error al cargar la imagen")
//        }
//        }
                //cell.imageView.image = ""
        cell.lblNombre.text = pokemons[indexPath.row].results?.description
        cell.lblText.text = String(pokemons[indexPath.row].count!)
               // print(self.categoria)
         
     
         
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.categoria.count
        return 1
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
