//
//  PokemonDetailVC.swift
//  Pokedexxx
//
//  Created by D on 9/3/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
   var pokemon: Pokemon!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UIStackView!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
