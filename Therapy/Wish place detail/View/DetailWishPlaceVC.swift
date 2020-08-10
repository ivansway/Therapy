//
//  DetailWishPlaceVC.swift
//  Therapy
//
//  Created by Ivan Myrza on 25/07/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class DetailWishPlaceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        // BACK COLOR
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        
        closeButton()
    }
    
    // CLOSE BUTTON
    func closeButton() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(popSelfVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.view, view: button, widthAnchor: 18, heightAnchor: 18, leadingAnchor: 18, topAnchor: 40)
    }
    
    func constructEnvironmentItems(environmentDict: [String: String]) {
        print(environmentDict)
    }
}
