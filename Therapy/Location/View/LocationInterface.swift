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
    var superView: UIView
    var dictPlace = [String: Place]()
    var placeIncrement: CGFloat = 80
    var placeName = 0
    
    // SWITCH
    let waterSwitch = UISwitch()
    let electroSwitch = UISwitch()
    
    // INIT
    init(superView: UIView) {
        self.superView = superView
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
        self.dictPlace["\(placeName)"] = Place(superView: superView, top: placeIncrement, waterSwitch: waterSwitch, electroSwitch: electroSwitch)
        self.placeIncrement += 410
        self.placeName += 1
    }
    
}
