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
    var paginacion : String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var nextPaginacion : String = ""
    var previusPaginacion : String? = nil
    var id : String = ""
    var color = UIColor.red.cgColor
    var color2 = UIColor.white.cgColor
    var elemento : String = ""
    
    
    var result = Tipos()
    
    //Outlet
    
    @IBOutlet weak var btnBuscarOutlet: UIButton!
    
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
    func GetElement() {
        if self.elemento != ""{
            PokemonViewModel.GetByElemento(elemento: self.elemento) { result, error in
                self.pokemonsList.removeAll()
                if let resultSource = result {
                    self.result = resultSource
                    for ObjPokemon in result!.pokemon!{
                        var pokemonElement = Results()
                        pokemonElement.name = ObjPokemon.pokemon.name
                        pokemonElement.url = ObjPokemon.pokemon.url
                        self.pokemonsList.append(pokemonElement)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                }else {
                    print("No existe esa categoria")//podria ser una alerta que no hay categoria
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Mensaje", message: "No existe ese nombre,id o elemento.Tambien puede estar mal escrito.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Aceptar", style: .default)
                        alert.addAction(action)
                        
                        self.present(alert, animated: true)
                        self.pokemonsList.removeAll()
                        self.collectionView.reloadData()
                        
                    }
                }
                
            }
        }
        print("me sali por que no tengo info")
        
    }
    
    @IBAction func btnBuscar(_ sender: UIButton) {
        self.pokemonName = ""
        self.pokemonName = txtBuscar.text!
        // self.id = txtBuscar.text!
        print(self.pokemonName)
        guard txtBuscar.text != "" else{
            
            txtBuscar.layer.borderColor = color
            txtBuscar.layer.borderWidth = 1.0
            updateUI()
            return
        }
        txtBuscar.layer.borderColor = color2
        txtBuscar.layer.borderWidth = 1.0
        PokemonViewModel.GetByName(namePokemon: self.pokemonName) { result, error in
            self.pokemonsList.removeAll()
            if let resultSource = result {
                DispatchQueue.main.async{
                    var objpoke = Results()
                    objpoke.name = result?.name
                    self.id = String(result!.id!)
                    var url1 : String = "https://pokeapi.co/api/v2/pokemon/\(self.id)"
                    objpoke.url = url1
                    self.pokemonsList.append(objpoke)
                    self.collectionView.reloadData()
                }
            }
            
            else {
                
                PokemonViewModel.GetByElemento(elemento: self.pokemonName) { result, error in
                    self.pokemonsList.removeAll()
                    if let resultSource = result {
                        self.result = resultSource
                        for ObjPokemon in result!.pokemon!{
                            var pokemonElement = Results()
                            pokemonElement.name = ObjPokemon.pokemon.name
                            pokemonElement.url = ObjPokemon.pokemon.url
                            self.pokemonsList.append(pokemonElement)
                        }
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                        
                    }else {
                        print("No existe esa categoria")//podria ser una alerta que no hay categoria
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Mensaje", message: "No existe ese nombre,id o elemento.Tambien puede estar mal escrito.", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Aceptar", style: .default)
                            alert.addAction(action)
                            
                            self.present(alert, animated: true)
                            self.pokemonsList.removeAll()
                            self.collectionView.reloadData()
                            
                        }
                    }
                    
                }
                
            }
        }
    }
    
    @IBAction func btnSiguiente(_ sender: UIButton) {
        self.paginacion = self.nextPaginacion
        // print(self.paginacion)
        updateUI()
        
    }
    
    
    @IBAction func btnAnterior(_ sender: UIButton) {
        print("paginacion: \(self.previusPaginacion)")
        if  self.previusPaginacion == nil{
            
        }else{
            self.paginacion = self.previusPaginacion!
            //  print(self.paginacion)
            updateUI()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //        NotificationCenter.default.post(name: NSNotification.Name("ButtonActivationNotification"), object: nil)
        //        self.btnBuscarOutlet.isEnabled  = true
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        GetElement()
        
    }
    func updateUI(){
        self.pokemonsList.removeAll()
        collectionView.reloadData()
        PokemonViewModel.GetPokemon(paginacion: self.paginacion) { result, error in
            DispatchQueue.main.async {
                if result! != nil {
                    self.previusPaginacion = result?.previous ?? nil
                    self.nextPaginacion = result!.next!
                    for objPokemon in result!.results {
                        
                        
                        
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
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        
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
        pokemonsList[indexPath.row].url
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
