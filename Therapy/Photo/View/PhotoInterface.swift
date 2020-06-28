//
//  PhotoInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 20/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit

class PhotoInterface: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    // COLLECTION VIEW
    func collectionView(superView: UIView) {
        
        let collection: UICollectionView? = UICollectionView()
        collection?.delegate = self
        Constraints.heightLeadingTrailingTop(superView: superView, view: collection!, heightAnchor: 300, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
}
