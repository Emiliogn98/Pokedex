//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Emilio García Navarrete on 19/06/23.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var imagenView: UIImageView!
    
    
    
    
    
    @IBOutlet weak var imageViewPokeball: UIImageView!
    @IBOutlet weak var btnPokeball: UIButton!
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
