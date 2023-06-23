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
    private let onboardingImageViewDefault: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pokeball1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let onboardingImageViewShiny: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pokeball")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()

    
    private let textLabelNombreElemento : UILabel = {
        let lblNombre = UILabel()
        lblNombre.numberOfLines = 0
        lblNombre.textAlignment = .center
        lblNombre.text = "nombre"
        lblNombre.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblNombre.translatesAutoresizingMaskIntoConstraints = false
        lblNombre.backgroundColor = UIColor.red
        lblNombre.layer.cornerRadius = 15
        lblNombre.layer.masksToBounds = true
        return lblNombre
    }()
    private let textLabelImagenDefault : UILabel = {
        let lblImagenDefault = UILabel()
        lblImagenDefault.numberOfLines = 0
        lblImagenDefault.textAlignment = .center
        lblImagenDefault.text = "Normal"
        lblImagenDefault.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        lblImagenDefault.translatesAutoresizingMaskIntoConstraints = false
        lblImagenDefault.backgroundColor = UIColor.red
        lblImagenDefault.layer.cornerRadius = 15
        lblImagenDefault.layer.masksToBounds = true
        return lblImagenDefault
    }()
    private let textLabelImagenShiny : UILabel = {
        let lblImagenShiny = UILabel()
        lblImagenShiny.numberOfLines = 0
        lblImagenShiny.textAlignment = .center
        lblImagenShiny.text = "Shiny"
        lblImagenShiny.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        lblImagenShiny.translatesAutoresizingMaskIntoConstraints = false
        lblImagenShiny.backgroundColor = UIColor.red
        lblImagenShiny.layer.cornerRadius = 15
        lblImagenShiny.layer.masksToBounds = true
        return lblImagenShiny
    }()
    
    private lazy var onboardBtnTipos : UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "TIPO"
        

        let btnTipos = UIButton(type: .system)
        btnTipos.addTarget(self, action: #selector(showMessage), for: .touchUpOutside)
        btnTipos.configuration = config
        btnTipos.translatesAutoresizingMaskIntoConstraints = false
        btnTipos.backgroundColor = UIColor.red
        return btnTipos
    }()
    
    private let textLabelNombrePokemon : UILabel = {
        let lblNombrePokemon = UILabel()
        lblNombrePokemon.numberOfLines = 0
        lblNombrePokemon.textAlignment = .center
        lblNombrePokemon.text = "nombre"
        lblNombrePokemon.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblNombrePokemon.translatesAutoresizingMaskIntoConstraints = false
        lblNombrePokemon.backgroundColor = UIColor.red
        lblNombrePokemon.layer.cornerRadius = 15
        lblNombrePokemon.layer.masksToBounds = true
        return lblNombrePokemon
    }()
    private let textLabelStatHP : UILabel = {
        let lblStatHP = UILabel()
        lblStatHP.numberOfLines = 0
        lblStatHP.textAlignment = .center
        lblStatHP.text = "HP"
        lblStatHP.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblStatHP.translatesAutoresizingMaskIntoConstraints = false
        lblStatHP.backgroundColor = UIColor.red
        lblStatHP.layer.cornerRadius = 15
        lblStatHP.layer.masksToBounds = true
        return lblStatHP
    }()
    
    private let onboardingImageViewStatHP: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatDefensa : UILabel = {
        let lblStatDefensa = UILabel()
        lblStatDefensa.numberOfLines = 0
        lblStatDefensa.textAlignment = .center
        lblStatDefensa.text = "Defensa"
        lblStatDefensa.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblStatDefensa.translatesAutoresizingMaskIntoConstraints = false
        lblStatDefensa.backgroundColor = UIColor.red
        lblStatDefensa.layer.cornerRadius = 15
        lblStatDefensa.layer.masksToBounds = true
        return lblStatDefensa
    }()
    private let onboardingImageViewStatDefensa: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "defense")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatAtaque : UILabel = {
        let lblStatAtaque = UILabel()
        lblStatAtaque.numberOfLines = 0
        lblStatAtaque.textAlignment = .center
        lblStatAtaque.text = "Ataque"
        lblStatAtaque.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblStatAtaque.translatesAutoresizingMaskIntoConstraints = false
        lblStatAtaque.backgroundColor = UIColor.red
        lblStatAtaque.layer.cornerRadius = 15
        lblStatAtaque.layer.masksToBounds = true
        return lblStatAtaque
    }()
    private let onboardingImageViewStatAtaque: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sword")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    private let textLabelStatEspecial : UILabel = {
        let lblStatAtaque = UILabel()
        lblStatAtaque.numberOfLines = 0
        lblStatAtaque.textAlignment = .center
        lblStatAtaque.text = "special"
        lblStatAtaque.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        lblStatAtaque.translatesAutoresizingMaskIntoConstraints = false
        lblStatAtaque.backgroundColor = UIColor.red
        lblStatAtaque.layer.cornerRadius = 15
        lblStatAtaque.layer.masksToBounds = true
        return lblStatAtaque
    }()
    private let onboardingImageViewStatEspecial: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()

            /* Elementos */
    override func viewDidLoad() {
        super.viewDidLoad()
            /* Agregamos subvistas a la vista principal*/
        view.backgroundColor = .white
        [textLabelNombreElemento,onboardingImageViewDefault,onboardBtnTipos,textLabelImagenDefault,textLabelImagenShiny,onboardingImageViewShiny,
         textLabelNombrePokemon,textLabelStatHP,onboardingImageViewStatHP,textLabelStatDefensa,onboardingImageViewStatDefensa,textLabelStatAtaque,onboardingImageViewStatAtaque,textLabelStatEspecial,onboardingImageViewStatEspecial].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            /* label de elemento*/
            textLabelNombreElemento.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            textLabelNombreElemento.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelNombreElemento.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            /* Boton de elementos*/
            onboardBtnTipos.topAnchor.constraint(equalTo: textLabelNombreElemento.bottomAnchor, constant: 15),
            onboardBtnTipos.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            onboardBtnTipos.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardBtnTipos.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -665),
            /* label Imagen Pokemon normal*/
            textLabelImagenDefault.topAnchor.constraint(equalTo: onboardBtnTipos.bottomAnchor,constant: 15),
            textLabelImagenDefault.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            textLabelImagenDefault.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -180),
            textLabelImagenDefault.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -630),
            
            /* label imagen Pokemon Shiny*/
            textLabelImagenShiny.topAnchor.constraint(equalTo: onboardBtnTipos.bottomAnchor,constant: 15),
            textLabelImagenShiny.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -20),
            textLabelImagenShiny.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 180),
            textLabelImagenShiny.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -630),
    
            /* imagen del pokemon normal*/
            onboardingImageViewDefault.topAnchor.constraint(equalTo: textLabelImagenDefault.bottomAnchor,constant: 5),
            onboardingImageViewDefault.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            onboardingImageViewDefault.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -180),
            onboardingImageViewDefault.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -450),
            
            /* imagen del pokemon shiny*/
            
            onboardingImageViewShiny.topAnchor.constraint(equalTo: textLabelImagenShiny.bottomAnchor,constant: 5),
            onboardingImageViewShiny.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor,constant: -20),
            onboardingImageViewShiny.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor,constant: 185),
            onboardingImageViewShiny.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant: -450),
            
            /* label de nombre pokemon*/
            textLabelNombrePokemon.topAnchor.constraint(equalTo: onboardingImageViewShiny.bottomAnchor, constant: 10),
            textLabelNombrePokemon.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelNombrePokemon.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            textLabelNombrePokemon.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -410),
            /* label de  statHP*/
            textLabelStatHP.topAnchor.constraint(equalTo: textLabelNombrePokemon.bottomAnchor, constant: 30),
            textLabelStatHP.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
            textLabelStatHP.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 80),
            textLabelStatHP.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -350),
            
            /* imagen de stat hp*/
            onboardingImageViewStatHP.topAnchor.constraint(equalTo: textLabelNombrePokemon.bottomAnchor, constant: 30 ),
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
         
            
            
            
        
        ])

    }
    
    @objc func showMessage(){
        print("prueba boton")
    }


}
