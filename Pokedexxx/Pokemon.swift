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
    
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
        }
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionText: String {
        
        if _nextEvolutionText == nil {
            
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        
        self._name = name
        self._pokedexID = pokedexID
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
    }
    
    func downloadPokemonDetails(_ completed: @escaping DownloadComplete) {
        
        // Downloading the JSON data
        Alamofire.request(_pokemonURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print(response.result.value)
        
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
            
             if let weight = dict["weight"] as? String {
            
                self._weight = weight
            }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._weight)
                print(self._defense)
                print(self._height)
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    print(self._type)
                    
                } else {
                    
                    self._type = ""
                }
                
                if let descriptionArray = dict["descriptions"] as? [Dictionary<String, String>] , descriptionArray.count > 0 {
                    
                    if let url = descriptionArray[0]["resource_uri"] {
                        
                        let descriptionURL = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descriptionURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                            
                            if let descriptionDictionary = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descriptionDictionary["description"] as? String {
                                    
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    
                                    print(newDescription)
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
                
            }
           completed()
        }

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
