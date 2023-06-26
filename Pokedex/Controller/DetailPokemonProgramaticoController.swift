//
//  DetailPokemonProgramaticoController.swift
//  Pokedex
//
//  Created by MacBookMBA4 on 23/06/23.
//

import UIKit

class DetailPokemonProgramaticoController: UIViewController {
    var pokemonName : String = ""
    var elemento : String = ""
    var url : String = ""
    var id : String = ""
    var pokemon : [Pokemon] = []
    var pokemonStats : [Stats] = []
    var pokemonTypes : [Types] = []
    let colors: [String: UIColor] = ["normal": UIColor(named: "normal")!, "water": UIColor(named: "water")!,"fire": UIColor(named: "fire")!,
                                     "grass": UIColor(named: "grass")!, "ground": UIColor(named: "ground")!, "rock": UIColor(named: "rock")!, "poison": UIColor(named: "poison")!, "psychic": UIColor(named: "psychic")!, "electric": UIColor(named: "electric")!, "ghost": UIColor(named: "ghost")!, "fighting": UIColor(named: "fighting")!, "bug": UIColor(named: "bug")!, "ice": UIColor(named: "ice")!,"dark": UIColor(named: "dark")!,"steel": UIColor(named: "steel")!, "dragon": UIColor(named: "dragon")!, "flying": UIColor(named: "flying")!]
    
    
    
    /* elementos*/
    private let ImageViewDefault: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pokeball")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "fondogris")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let ImageViewShiny: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pokeball")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "fondogris")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let textLabelNombreElemento : UILabel = {
        let lblNombre = UILabel()
        lblNombre.numberOfLines = 0
        lblNombre.textAlignment = .center
        lblNombre.text = "Elemento"
        lblNombre.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        lblNombre.translatesAutoresizingMaskIntoConstraints = false
        // lblNombre.backgroundColor = UIColor.red
        lblNombre.layer.cornerRadius = 15
        lblNombre.layer.masksToBounds = true
        return lblNombre
    }()
    private let textLabelImagenDefault : UILabel = {
        let lblImagenDefault = UILabel()
        lblImagenDefault.numberOfLines = 0
        lblImagenDefault.textAlignment = .center
        lblImagenDefault.text = "Normal"
        lblImagenDefault.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblImagenDefault.translatesAutoresizingMaskIntoConstraints = false
        lblImagenDefault.layer.cornerRadius = 15
        lblImagenDefault.layer.masksToBounds = true
        return lblImagenDefault
    }()
    private let textLabelImagenShiny : UILabel = {
        let lblImagenShiny = UILabel()
        lblImagenShiny.numberOfLines = 0
        lblImagenShiny.textAlignment = .center
        lblImagenShiny.text = "Shiny"
        lblImagenShiny.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblImagenShiny.translatesAutoresizingMaskIntoConstraints = false
        //  lblImagenShiny.backgroundColor = UIColor.red
        lblImagenShiny.layer.cornerRadius = 15
        lblImagenShiny.layer.masksToBounds = true
        return lblImagenShiny
    }()
    private lazy var btnTipos : UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "TIPO"
        let btnTipos = UIButton(type: .system)
        btnTipos.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        btnTipos.configuration = config
        btnTipos.translatesAutoresizingMaskIntoConstraints = false
        btnTipos.setTitleColor(UIColor.black, for: .normal)
        // btnTipos.backgroundColor = UIColor.red
        return btnTipos
    }()
    private lazy var btnTipos2 : UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "TIPO"
        let btnTipos2 = UIButton(type: .system)
        btnTipos2.addTarget(self, action: #selector(showMessage2), for: .touchUpInside)
        btnTipos2.configuration = config
        btnTipos2.translatesAutoresizingMaskIntoConstraints = false
        btnTipos2.setTitleColor(UIColor.black, for: .normal)
        //btnTipos.backgroundColor = UIColor.red
        return btnTipos2
    }()
    
    private let textLabelNombrePokemon : UILabel = {
        let lblNombrePokemon = UILabel()
        lblNombrePokemon.numberOfLines = 0
        lblNombrePokemon.textAlignment = .center
        lblNombrePokemon.text = "nombre"
        lblNombrePokemon.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        lblNombrePokemon.translatesAutoresizingMaskIntoConstraints = false
        //  lblNombrePokemon.backgroundColor = UIColor.red
        lblNombrePokemon.layer.cornerRadius = 15
        lblNombrePokemon.layer.masksToBounds = true
        return lblNombrePokemon
    }()
    private let textLabelStatHP : UILabel = {
        let lblStatHP = UILabel()
        lblStatHP.numberOfLines = 0
        lblStatHP.textAlignment = .center
        lblStatHP.text = "HP"
        lblStatHP.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblStatHP.translatesAutoresizingMaskIntoConstraints = false
        lblStatHP.backgroundColor = UIColor(named: "fondogris")
        lblStatHP.layer.cornerRadius = 15
        lblStatHP.layer.masksToBounds = true
        return lblStatHP
    }()
    
    private let onboardingImageViewStatHP: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatDefensa : UILabel = {
        let lblStatDefensa = UILabel()
        lblStatDefensa.numberOfLines = 0
        lblStatDefensa.textAlignment = .center
        lblStatDefensa.text = "Defensa"
        lblStatDefensa.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblStatDefensa.translatesAutoresizingMaskIntoConstraints = false
        lblStatDefensa.backgroundColor = UIColor(named: "fondogris")
        lblStatDefensa.layer.cornerRadius = 15
        lblStatDefensa.layer.masksToBounds = true
        return lblStatDefensa
    }()
    private let onboardingImageViewStatDefensa: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "defense")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatAtaque : UILabel = {
        let lblStatAtaque = UILabel()
        lblStatAtaque.numberOfLines = 0
        lblStatAtaque.textAlignment = .center
        lblStatAtaque.text = "Ataque"
        lblStatAtaque.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblStatAtaque.translatesAutoresizingMaskIntoConstraints = false
        lblStatAtaque.backgroundColor = UIColor(named: "fondogris")
        lblStatAtaque.layer.cornerRadius = 15
        lblStatAtaque.layer.masksToBounds = true
        return lblStatAtaque
    }()
    private let onboardingImageViewStatAtaque: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sword")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //  imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatEspecial : UILabel = {
        let lblStatAtaque = UILabel()
        lblStatAtaque.numberOfLines = 0
        lblStatAtaque.textAlignment = .center
        lblStatAtaque.text = "special"
        lblStatAtaque.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        lblStatAtaque.translatesAutoresizingMaskIntoConstraints = false
        lblStatAtaque.backgroundColor = UIColor(named: "fondogris")
        lblStatAtaque.layer.cornerRadius = 15
        lblStatAtaque.layer.masksToBounds = true
        return lblStatAtaque
    }()
    private let onboardingImageViewStatEspecial: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelBusqueda : UILabel = {
        let lblBusqueda = UILabel()
        lblBusqueda.numberOfLines = 0
        lblBusqueda.textAlignment = .center
        lblBusqueda.text = "Búsqueda"
        lblBusqueda.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        lblBusqueda.translatesAutoresizingMaskIntoConstraints = false
        lblBusqueda.backgroundColor = UIColor(named: "fondogris")
        lblBusqueda.layer.cornerRadius = 15
        lblBusqueda.layer.masksToBounds = true
        return lblBusqueda
    }()
    private lazy var btnFavoritos : UIButton = {
        var config = UIButton.Configuration.borderless()
        //config.baseBackgroundColor = .black
      
        //config.title = "Favoritos"
        let btnFavoritos = UIButton(type: .system)
        btnFavoritos.addTarget(self, action: #selector(favoritos), for: .touchUpInside)
        btnFavoritos.isSelected = false
        btnFavoritos.configuration = config
        btnFavoritos.setImage(UIImage.init(systemName: "heart"), for: .normal)
        btnFavoritos.translatesAutoresizingMaskIntoConstraints = false
        btnFavoritos.setTitleColor(UIColor.black, for: .normal)
     
       
        return btnFavoritos
    }()
    
    /* Elementos */
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Agregamos subvistas a la vista principal*/
        view.backgroundColor = .white
        [textLabelNombreElemento,ImageViewDefault,btnTipos,textLabelImagenDefault,textLabelImagenShiny,ImageViewShiny,
         textLabelNombrePokemon,textLabelStatHP,onboardingImageViewStatHP,textLabelStatDefensa,onboardingImageViewStatDefensa,textLabelStatAtaque,onboardingImageViewStatAtaque,textLabelStatEspecial,onboardingImageViewStatEspecial,btnTipos2,textLabelBusqueda,btnFavoritos].forEach(view.addSubview)
        view.bringSubviewToFront(btnFavoritos)
        
        /* constraints */
        NSLayoutConstraint.activate([
            /* label de elemento*/
            textLabelNombreElemento.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            textLabelNombreElemento.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelNombreElemento.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            
            /* label Imagen Pokemon normal*/
            textLabelImagenDefault.topAnchor.constraint(equalTo: textLabelNombreElemento.bottomAnchor,constant: 25),
            textLabelImagenDefault.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            textLabelImagenDefault.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -180),
            textLabelImagenDefault.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -630),
            
            /* label imagen Pokemon Shiny*/
            textLabelImagenShiny.topAnchor.constraint(equalTo: textLabelNombreElemento.bottomAnchor,constant: 25),
            textLabelImagenShiny.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -20),
            textLabelImagenShiny.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 180),
            textLabelImagenShiny.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -630),
            
            /* imagen del pokemon normal*/
            ImageViewDefault.topAnchor.constraint(equalTo: textLabelImagenDefault.bottomAnchor,constant: 5),
            ImageViewDefault.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            ImageViewDefault.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -180),
            ImageViewDefault.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -450),
            
            /* imagen del pokemon shiny*/
            
            ImageViewShiny.topAnchor.constraint(equalTo: textLabelImagenShiny.bottomAnchor,constant: 5),
            ImageViewShiny.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -20),
            ImageViewShiny.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 185),
            ImageViewShiny.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -450),
            
            /* label de nombre pokemon*/
            textLabelNombrePokemon.topAnchor.constraint(equalTo: ImageViewShiny.bottomAnchor, constant: 20),
            textLabelNombrePokemon.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelNombrePokemon.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            textLabelNombrePokemon.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -400),
            /* label de  statHP*/
            textLabelStatHP.topAnchor.constraint(equalTo: textLabelNombrePokemon.bottomAnchor, constant: 20),
            textLabelStatHP.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelStatHP.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 80),
            textLabelStatHP.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -350),
            
            /* imagen de stat hp*/
            onboardingImageViewStatHP.topAnchor.constraint(equalTo: textLabelNombrePokemon.bottomAnchor, constant: 15 ),
            onboardingImageViewStatHP.rightAnchor.constraint(equalTo: textLabelStatHP.leftAnchor, constant: -20 ),
            onboardingImageViewStatHP.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardingImageViewStatHP.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -350),
            /* label de  statDefensa*/
            textLabelStatDefensa.topAnchor.constraint(equalTo: textLabelStatHP.bottomAnchor, constant: 15),
            textLabelStatDefensa.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelStatDefensa.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 80),
            textLabelStatDefensa.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -305),
            
            /* imagen de stat hp*/
            onboardingImageViewStatDefensa.topAnchor.constraint(equalTo: onboardingImageViewStatHP.bottomAnchor, constant: 15 ),
            onboardingImageViewStatDefensa.rightAnchor.constraint(equalTo: textLabelStatHP.leftAnchor, constant: -20 ),
            onboardingImageViewStatDefensa.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardingImageViewStatDefensa.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -305),
            /* label de  statAtaque*/
            textLabelStatAtaque.topAnchor.constraint(equalTo: textLabelStatDefensa.bottomAnchor, constant: 15),
            textLabelStatAtaque.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelStatAtaque.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 80),
            textLabelStatAtaque.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -260),
            /* imagen de stat Ataque*/
            onboardingImageViewStatAtaque.topAnchor.constraint(equalTo: onboardingImageViewStatDefensa.bottomAnchor, constant: 15 ),
            onboardingImageViewStatAtaque.rightAnchor.constraint(equalTo: textLabelStatAtaque.leftAnchor, constant: -20 ),
            onboardingImageViewStatAtaque.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardingImageViewStatAtaque.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -260),
            /* label de  statEspecial*/
            textLabelStatEspecial.topAnchor.constraint(equalTo: textLabelStatAtaque.bottomAnchor, constant: 15),
            textLabelStatEspecial.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelStatEspecial.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 80),
            textLabelStatEspecial.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -215),
            /* imagen de stat especial*/
            onboardingImageViewStatEspecial.topAnchor.constraint(equalTo: onboardingImageViewStatAtaque.bottomAnchor, constant: 15 ),
            onboardingImageViewStatEspecial.rightAnchor.constraint(equalTo: textLabelStatEspecial.leftAnchor, constant: -20 ),
            onboardingImageViewStatEspecial.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardingImageViewStatEspecial.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -215),
            /* label de busqueda*/
            textLabelBusqueda.topAnchor.constraint(equalTo: textLabelStatEspecial.bottomAnchor, constant: 15),
            textLabelBusqueda.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelBusqueda.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            textLabelBusqueda.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -170),
            /* Boton de elementos 1*/
            btnTipos.topAnchor.constraint(equalTo: textLabelBusqueda.bottomAnchor, constant: 40),
            btnTipos.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -120),
            btnTipos.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 120),
            btnTipos.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -100),
            /* Boton de elementos 2*/
            btnTipos2.topAnchor.constraint(equalTo: btnTipos.bottomAnchor, constant: 20),
            btnTipos2.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -120),
            btnTipos2.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 120),
            btnTipos2.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -50),
            /* boton de Favoritos*/
           // btnFavoritos.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            btnFavoritos.topAnchor.constraint(equalTo: textLabelBusqueda.bottomAnchor, constant: 12),
            //btnFavoritos.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -710),
            btnFavoritos.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -70),
            btnFavoritos.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            btnFavoritos.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 250)
            
            
            
            
            
            
        ])
        
        
        updateUI()
        
    }
    
    @objc func showMessage(){
        
        print("aprete el boton1")
        self.elemento = self.pokemonTypes[0].type!.name!
        self.performSegue(withIdentifier: "DetalleGetSegue", sender: self)
    }
    @objc func showMessage2(){
        
        print("aprete el boton1")
        self.elemento = self.pokemonTypes[1].type!.name!
        self.performSegue(withIdentifier: "DetalleGetSegue", sender: self)
    }
    @objc func favoritos(){
     
        btnFavoritos.isSelected = !btnFavoritos.isSelected
        
        if btnFavoritos.isSelected {
            print("aprete boton favoritos")
            btnFavoritos.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            let alert = UIAlertController(title: "Mensaje", message: "Se agrego a Favoritos el Pokemon \(self.pokemonName)!.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        } else {
            btnFavoritos.setImage(UIImage.init(systemName: "heart"), for: .normal)
            
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //controlar que hacer antes de ir a la siguiente vista
        if segue.identifier == "DetalleGetSegue" {
            let formControl = segue.destination as! GetPokemonController
            
            formControl.elemento = self.elemento
            //formControl.btnBuscarOutlet!.isSelected = true
        }
    }
    
    func updateUI(){
    
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
                            // self.imageView.image = image
                            self.ImageViewDefault.image = image
                            
                            
                        } else {
                            print("error al cargar la imagen")
                        }
                        let imageURLString = "\(result!.sprites!.front_shiny!)"
                        UIImage.loadImageFromURL(imageURLString) { [self] (image) in
                            if let image = image {
                                // La imagen se cargó exitosamente desde la URL
                                
                                self.ImageViewShiny.image = image
                                
                                
                            } else {
                                print("error al cargar la imagen")
                            }
                            self.textLabelNombrePokemon.text = "#\(result!.id!) Pokémon: \(result!.name!)"
                            self.textLabelStatHP.text = "  \(self.pokemonStats[0].stat!.name!) : \(self.pokemonStats[0].base_stat!)"
                            self.textLabelStatDefensa.text = "  \(self.pokemonStats[1].stat!.name!) : \(self.pokemonStats[1].base_stat!)"
                            self.textLabelStatAtaque.text = "  \(self.pokemonStats[2].stat!.name!) : \(self.pokemonStats[2].base_stat!)"
                            self.textLabelStatEspecial.text = "  \(self.pokemonStats[3].stat!.name!) : \(self.pokemonStats[3].base_stat!)"
                            self.textLabelNombreElemento.text = "Tipo: \(self.pokemonTypes[0].type!.name!)"
                            
                            
                            if let color = colors[self.pokemonTypes[0].type!.name!]{
                                DispatchQueue.main.async {
                                    self.textLabelNombreElemento.backgroundColor = color
                                    // self.view.backgroundColor = color
                                    //self.view.backgroundColor = UIColor(named: "fondogris")
                                    self.textLabelNombrePokemon.backgroundColor = color
                                    self.textLabelImagenDefault.backgroundColor = color
                                    self.textLabelImagenShiny.backgroundColor = color
                                    self.textLabelBusqueda.backgroundColor = color
                                    self.btnTipos.tintColor = color
                                    self.btnTipos.setTitle("\(self.pokemonTypes[0].type!.name!)", for: .normal)
                           
                                }
                            }
                            if self.pokemonTypes.count >= 2{
                                print("entro por que tiene 2 elementos")
                                self.btnTipos2.isHidden = false
                                if let color2 = colors[self.pokemonTypes[1].type!.name!]{
                                    
                                    self.btnTipos2.tintColor = color2
                                    self.btnTipos2.setTitle("\(self.pokemonTypes[1].type!.name!)", for: .normal)
                                    
                                }
                            }
                            else{
                                print("entre aqui por que tengo 1 elemento")
                                self.btnTipos2.isHidden = true
                                
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    
}
