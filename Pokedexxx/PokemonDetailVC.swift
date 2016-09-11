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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        
        mainImage.image = img
        
        currentEvoImage.image = img
        
        pokedexIdLabel.text = "\(pokemon.pokedexID)"
        
        pokemon.downloadPokemonDetails {
       // Whatever we write will only be called when the network call is done!
            
        self.updateUI()
        }
    }
    
    func updateUI() {
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        typeLabel.text = pokemon.type
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
