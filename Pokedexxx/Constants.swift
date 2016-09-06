//
//  Constants.swift
//  Pokedexxx
//
//  Created by D on 9/5/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/1/"

//Way to let the view controller know when the data is avail (using the closure)
typealias DownloadComplete = () -> ()
