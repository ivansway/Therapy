//
//  Description.swift
//  Therapy
//
//  Created by Ivan Myrza on 16/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Place {
    
    // PICKER
    var parkAbility: Picker!
    var gasStattion: Picker!
    
    // INSTANCE
    var addButton: AddButton!
    
    
    // BUTTON
    let saveButton = UIButton()
    
    // TF
    let parkingTF = UITextField()
    let gasStationTF = UITextField()
    
    // CHECK BOX
    let electroBox = UIButton()
    let waterBox = UIButton()
    
    // BACK
    let back = UIView()
    var navController: UINavigationController
    var viewController: UIViewController
    var superView: UIView
    var top: CGFloat
    var waterSwitch: UISwitch
    var electroSwitch: UISwitch
    
    // INIT
    init(superView: UIView, top: CGFloat, waterSwitch: UISwitch, electroSwitch: UISwitch,
         navController: UINavigationController, viewController: UIViewController) {
        
        self.superView = superView
        self.top = top
        self.waterSwitch = waterSwitch
        self.electroSwitch = electroSwitch
        self.navController = navController
        self.viewController = viewController
        setup()
    }
    
    // SETUP
    func setup() {
        
        // BACK
        self.back(height: 450)
        
        // DESCRIPTION
        self.description(top: 260)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 0)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 50)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 100)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 150)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 250)
        
        // TITLES
        
            // PARKING ABILITY
            self.title(text: "Parking ability", top: 16)
        
            // ELECTRICITY
            self.title(text: "Electricity", top: 65)
        
            // WATER
            self.title(text: "Water", top: 115)
        
            // GAS STATION
            self.title(text: "Gas station", top: 165)
        
            // GAS LOCATION
            self.title(text: "Location", top: 215)
            
            // MAP
            self.map(top: 215)
        
        // PARKING PICKER
        self.picker()
        
        // SAVE
        self.save()

        
        // CHECK BOX
        self.checkBox(top: 63, checkBox: electroBox)
        
        // CHECK BOX
        self.checkBox(top: 113, checkBox: waterBox)
        
    }
    
    // BACK
    func back(height: CGFloat) {
        
        Constraints.heightLeadingTrailingTop(superView: superView, view: back, heightAnchor: height, leadingAnchor: 0, trailingAnchor: 0, topAnchor: top)
    }
    
    // DESCRIPTION
    func description(top: CGFloat) {
        
        let descriptionBack = UIView()
        descriptionBack.layer.borderWidth = 1
        descriptionBack.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        descriptionBack.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: back, view: descriptionBack, heightAnchor: 102, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        
        let descriptionTV = UITextView()
        descriptionTV.font = UIFont(name: "Optima", size: 18)
        descriptionTV.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        Constraints.heightLeadingTrailingTop(superView: descriptionBack, view: descriptionTV, heightAnchor: 102, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 0)
    }
    
    // LINE SEPARATOR
    func lineSeparator(top: CGFloat) {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        Constraints.heightLeadingTrailingTop(superView: back, view: view, heightAnchor: 1, leadingAnchor: 16, trailingAnchor: 0, topAnchor: top)
    }
    
    // PARKING TITLE
    func title(text: String, top: CGFloat) {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Optima", size: 18)
        Constraints.leadingTopStretchableWidthHeight(superView: back, view: label, leadingAnchor: 16, topAnchor: top, widthAnchor: 10, heightAnchor: 24)
        
    }
    
    // PICKER
    func picker() {
        
        // DISTANCE ARRAY
        let distance = Array(0...99)
        var stringDistance: [String] = []
        for item in distance {
            stringDistance.append("\(item)" + " km")
        }
        
        // PARK ABILITY
        self.parkAbility = Picker(superView: back, textField: parkingTF, array: ["", "Car", "Truck"], top: 16)
        
        // GAS STATION
        self.gasStattion = Picker(superView: back, textField: gasStationTF, array: stringDistance, top: 165)
    }
    
    // SAVE BUTTON
    func save() {
        self.addButton = AddButton(superView: back, button: saveButton, top: 322, text: "Save", backColor: UIColor(red: 0.184, green: 0.352, blue: 0.215, alpha: 1), textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    // DEPRECATED
    // THE SWITCH
//    func theSwitch(theSwitch: UISwitch, top: CGFloat) {
//        theSwitch.onTintColor = UIColor(red: 0.184, green: 0.352, blue: 0.215, alpha: 1)
//        Constraints.widthHeightTrailingTop(superView: back, view: theSwitch, widthAnchor: 46, heightAnchor: 36, trailingAnchor: -16, topAnchor: top)
//    }
    
    // CHECK BOX
    func checkBox(top: CGFloat, checkBox: UIButton) {
        
        guard let image = UIImage(named: "check_box") else { return }
        checkBox.setImage(image, for: .normal)
        checkBox.alpha = 0.6
        checkBox.addTarget(self, action: #selector(checkMark(sender:)), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: back, view: checkBox, widthAnchor: 24, heightAnchor: 24, trailingAnchor: -16, topAnchor: top)
        
    }
    
    // CHECK MARK
    @objc func checkMark(sender: UIButton) {
        let checkMark = UIImageView()
        guard let image = UIImage(named: "checkMark") else { return }
        checkMark.image = image
        Constraints.widthHeightTrailingTop(superView: sender, view: checkMark, widthAnchor: 15, heightAnchor: 15, trailingAnchor: -4, topAnchor: 4)
    }
    
    // MAP
    func map(top: CGFloat) {
        let map = UIButton()
        guard let image = UIImage(named: "map_icon") else { return }
        map.setImage(image, for: .normal)
        map.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: back, view: map, widthAnchor: 27, heightAnchor: 27, trailingAnchor: -16, topAnchor: top)
    }
    
    @objc func openMap() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.viewController.present(mapVC, animated: true)
    }
}
