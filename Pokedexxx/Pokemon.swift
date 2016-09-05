//
//  Pokemon.swift
//  Pokedexxx
//
//  Created by D on 9/1/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        
        self._name = name
        self._pokedexID = pokedexID
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexID)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL!, withMethod: .get).responseJSON() { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
            
             if let weight = dict["weight"] as? String {
                
            
                self._weight = weight
            }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let attack = dict["attack"] as? String {
                    
                    self._attack = attack
                }
                
                if let defense = dict["defense"] as? String {
                    
                    self._defense = defense
                }
               print(self._weight)
               print(self._height)
               print(self._attack)
               print(self._defense)
        }
    }

}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
