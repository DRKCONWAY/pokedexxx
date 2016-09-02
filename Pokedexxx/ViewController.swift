//
//  ViewController.swift
//  Pokedexxx
//
//  Created by D on 9/1/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewFlowLayout, UICollectionViewDelegate {

    
    @IBOutlet weak var collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
    }
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
}

