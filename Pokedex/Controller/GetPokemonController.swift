//
//  GetPokemonController.swift
//
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.

import UIKit

class GetPokemonController: UIViewController {
    var pokemonsList : [Results] = []
    var pokemonInfo : [Pokemon] = []
    var pokemonName : String = ""
    var text : String = ""
    var url : String = ""
    var id : String = ""
    var color = UIColor.red.cgColor
    var color2 = UIColor.white.cgColor
 
    
    
    //Outlet
    

    @IBOutlet weak var txtBuscar: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        updateUI()
       
    
       
 
      
       
    }
    //Action
    
    @IBAction func btnBuscar(_ sender: UIButton) {
        self.pokemonName = txtBuscar.text!
                      guard txtBuscar.text != "" else{
                                 
                          txtBuscar.layer.borderColor = color
                          txtBuscar.layer.borderWidth = 1.0
                                 return
                             }
                      txtBuscar.layer.borderColor = color2
                      txtBuscar.layer.borderWidth = 1.0
                   
        PokemonViewModel.GetByName(namePokemon: self.pokemonName) { result, error in
            DispatchQueue.main.async{
                if result.self != nil {
                    for objPokemon in result!.self.sprites{
                        var poke = objPokemon as! Pokemon
                        self.pokemonInfo.append(poke)
                       
                    }
                }
            }
        }
        
    }
    
    @IBAction func btnSiguiente(_ sender: UIButton) {
        
    }
    
    
    @IBAction func btnAnterior(_ sender: UIButton) {
    }
    override func viewWillAppear(_ animated: Bool) {
       // updateUI()
    }
    func updateUI(){
        collectionView.reloadData()
        PokemonViewModel.GetPokemon { result, error in
            DispatchQueue.main.async {
            if result!.self != nil {
                   
                for objPokemon in result.self!.results!{
                        self.pokemonsList.append(objPokemon)
                    
                    }
                self.collectionView.reloadData()
               // print(self.pokemonName)
                }
                self.collectionView.reloadData()
                
            }
        }
    }
}

// MARK: CollectionViewDelegate,DataSource

extension GetPokemonController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
               
       
        self.text = pokemonsList[indexPath.row].url!
        let textId = self.text.split(separator: "/")
       // print(textId.last!)
        let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(textId.last!).png"
        self.url = imageURLString
     
        
        UIImage.loadImageFromURL(imageURLString) { (image) in
        if let image = image {
        // La imagen se cargó exitosamente desde la URL
            cell.imagenView.image = image
          //  print(image)
         //   print("la imagen se cargo correcramente")
            
        } else {
            print("error al cargar la imagen")
        }
        }
        cell.lblNombre.text = "#\(textId.last!) \(pokemonsList[indexPath.row].name!)"
        self.pokemonName = pokemonsList[indexPath.row].name!
//        cell.lblText.isHidden = true
//        cell.lblText.text = pokemonsList[indexPath.row].url
      //  cell.btnPokeball.setImage(UIImage(named: "pokeball1"), for: .normal)
        cell.imageViewPokeball.image = UIImage(named: "pokeball")
        
       
        
     
         
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        return self.pokemonsList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.pokemonName = self.pokemonsList[indexPath.row].name!
        self.performSegue(withIdentifier: "PokemonDetailSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //controlar que hacer antes de ir a la siguiente vista
         
                         if segue.identifier == "PokemonDetailSegue" {
                             let formControl = segue.destination as! DetailPokemonController
                             formControl.pokemonName = self.pokemonName
                             formControl.url = self.url
                             //formControl.id = self.id
                             
         
                         }
         
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
