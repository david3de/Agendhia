//
//  StableViewController.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/22/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation
import UIKit

class StableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: Collection view functions
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        print(stable.count)
        return stable.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image cell", for: indexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        let imageName = stable[indexPath.item].name
        cell.imageView.image = UIImage( named : imageName)
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // handle tap events
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
            flowLayout.itemSize = CGSize(width: 197, height: 248)
        } else {
            flowLayout.itemSize = CGSize(width: 329, height: 413)
        }
        flowLayout.invalidateLayout()
    }
}
