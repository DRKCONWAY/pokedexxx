//
//  ViewController.swift
//  Pokedexxx
//
//  Created by D on 9/1/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]() //Pokemon array
    var musicPlayer: AVAudioPlayer!  //music player variable

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
        initAudio()
        
    }
    
//The function that will prepare my audio
    func initAudio() {
        
        //create a path to the music file that I added
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1 //loops over & over
            musicPlayer.play()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
        
    }
    
    func parsePokemonCSV() {
        
        //created a path to the pokemon.csv file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
    //Used the parser to pull out the rows
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
 //Loop through each row and pull out the data for the name and PokemonID 
            for row in rows {
                
                let pokeID = Int(row["id"]!)! //force unwrap
                let name = row["identifier"]!
                
//Make an initializer for the for loop above
                let poke = Pokemon(name: name, pokedexID: pokeID)
                
    //attaching the poke(name and ID) the Pokemon array above
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
    }

   //This will deque the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(pokemon: poke)
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
   //This sets the number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //This will return as many Pokemon as are in the array above (
        return pokemon.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //This will define the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
    
    
    @IBAction func musicButtonPressed(_ sender: UIButton) {
    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
}

