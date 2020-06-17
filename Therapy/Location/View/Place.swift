//
//  Description.swift
//  Therapy
//
//  Created by Ivan Myrza on 16/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Place {
    
    // INSTANCE
    var picker: Picker!
    var addButton: AddButton!
    
    // BUTTON
    let saveButton = UIButton()
    
    // TF
    let parkingTF = UITextField()
    
    // BACK
    let back = UIView()
    var superView: UIView
    var top: CGFloat
    var waterSwitch: UISwitch
    var electroSwitch: UISwitch
    
    init(superView: UIView, top: CGFloat, waterSwitch: UISwitch, electroSwitch: UISwitch) {
        self.superView = superView
        self.top = top
        self.waterSwitch = waterSwitch
        self.electroSwitch = electroSwitch
        setup()
    }
    
    // SETUP
    func setup() {
        
        // BACK
        self.back(height: 400)
        
        // DESCRIPTION
        self.description(top: 210)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 0)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 50)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 100)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 150)
        
        // PARKING ABILITY
        self.parkingTitle(text: "Parking ability", top: 16)
        
        // ELECTRICITY
        self.parkingTitle(text: "Electricity", top: 65)
        
        // WATER
        self.parkingTitle(text: "Water", top: 115)
        
        // PARKING PICKER
        self.parkingPicker()
        
        // SAVE
        self.save()
        
        // ELECTRO SWITCH
        self.theSwitch(theSwitch: electroSwitch, top: 60)
        
        // WATER SWITCH
        self.theSwitch(theSwitch: waterSwitch, top: 110)
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
    func parkingTitle(text: String, top: CGFloat) {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Optima", size: 18)
        Constraints.leadingTopStretchableWidthHeight(superView: back, view: label, leadingAnchor: 16, topAnchor: top, widthAnchor: 10, heightAnchor: 24)
        
    }
    
    // PARKING PICKER
    func parkingPicker() {
        self.picker = Picker(superView: back, textField: parkingTF, array: ["", "Car", "Truck"], top: 16)
    }
    
    // SAVE BUTTON
    func save() {
        self.addButton = AddButton(superView: back, button: saveButton, top: 322, text: "Save", backColor: UIColor(red: 0.184, green: 0.352, blue: 0.215, alpha: 1), textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    // THE SWITCH
    func theSwitch(theSwitch: UISwitch, top: CGFloat) {
        theSwitch.onTintColor = UIColor(red: 0.184, green: 0.352, blue: 0.215, alpha: 1)
        Constraints.widthHeightTrailingTop(superView: back, view: theSwitch, widthAnchor: 46, heightAnchor: 36, trailingAnchor: -16, topAnchor: top)
    }
}
