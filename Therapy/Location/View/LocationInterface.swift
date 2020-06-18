//
//  LocationInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 16/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class LocationInterface {
    
    // INSTANCE
    var place: Place!
    
    // MEMBERS
    var dictPlace = [String: Place]()
    var placeIncrement: CGFloat = 80
    var placeName = 0

    
    // SWITCH
    let waterSwitch = UISwitch()
    let electroSwitch = UISwitch()
    
    var superView: UIView
    var navController: UINavigationController
    var viewController: UIViewController
    
    // INIT
    init(superView: UIView, navController: UINavigationController, viewController: UIViewController) {
        self.superView = superView
        self.navController = navController
        self.viewController = viewController
    }
    
    // ADD BUTTON
    func addButton(superView: UIView) {
        
        let button = UIButton()
        guard let image = UIImage(named: "AddButton") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addPlace), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: superView, view: button, widthAnchor: 34, heightAnchor: 34, trailingAnchor: -16, topAnchor: 13)

        
        
    }
    
    // ADD PLACE
    @objc func addPlace() {
        self.dictPlace["\(placeName)"] = Place(superView: superView, top: placeIncrement, waterSwitch: waterSwitch, electroSwitch: electroSwitch, navController: navController, viewController: self.viewController)
        self.placeIncrement += 410
        self.placeName += 1
    }
    
}
