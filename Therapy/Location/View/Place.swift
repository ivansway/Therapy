//
//  Description.swift
//  Therapy
//
//  Created by Ivan Myrza on 16/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Place {
    
    // PICKER
    var parkAbilityP: Picker?
    var gasStattionP: Picker?
    var nearbyPicker: Picker?
    var amountPicker: Picker?
    
    // INSTANCE
    var addButton: AddButton!
    var bag: DisposeBag? = DisposeBag()
    var locationVM: LocationViewModel? = LocationViewModel()
    
    
    // BUTTON
    let saveButton: UIButton? = UIButton()
    
    // TF
    private var parkingTF: UITextField? = UITextField()
    private var gasStationTF: UITextField? = UITextField()
    private var nearbyTF: UITextField? = UITextField()
    private var amountTF: UITextField? = UITextField()
    
    // TV
    private var descriptionTV: UITextView? = UITextView()
    
    // ELECTRO BOX
    private var electroBox: CheckBox!
    private var electroButton: UIButton? = UIButton()
    private var electroIndicator = true
    
    // WATER BOX
    private var waterBox: CheckBox!
    private var waterButton: UIButton? = UIButton()
    private var waterIndicator = true
    
    // BACK
    private var back: UIView? = UIView()
    private var navController: UINavigationController
    private var viewController: UIViewController
    private var superView: UIView
    private var top: CGFloat
    private var waterSwitch: UISwitch
    private var electroSwitch: UISwitch
    
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
        self.back(height: 650)
        
        // DESCRIPTION
        self.description(top: 410)
        
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
        
        // LINE SEPARATOR
        self.lineSeparator(top: 300)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 350)
        
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
        
            // NEARBY
            self.title(text: "Nearby", top: 265)
        
            // AMOUNT
            self.title(text: "Amount", top: 315)
        
            // DESCRIPTION
            self.topic(text: "Description", top: 380)
            
        // MAP
        self.mapIcon(top: 215)
        
        // NEARBY PICKER
        self.nearbyP()
        
        // PARKING PICKER
        self.picker()
        
        // AMOUNT PICKER
        
        // SAVE
        self.save()
        
        // ELECTRO BOX
        self.electroBox = CheckBox(superView: back!, button: electroButton!, top: 63)
        
        // WATER BOX
        self.waterBox = CheckBox(superView: back!, button: waterButton!, top: 113)
    }
    
    // BACK
    func back(height: CGFloat) {
        
        Constraints.heightLeadingTrailingTop(superView: superView, view: back!, heightAnchor: height, leadingAnchor: 0, trailingAnchor: 0, topAnchor: top)
    }
    
    // DESCRIPTION
    func description(top: CGFloat) {
        
        let descriptionBack = UIView()
        descriptionBack.layer.borderWidth = 1
        descriptionBack.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        descriptionBack.layer.cornerRadius = 15
        Constraints.heightLeadingTrailingTop(superView: back!, view: descriptionBack, heightAnchor: 102, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        
        
        descriptionTV!.font = UIFont(name: "Optima", size: 18)
        descriptionTV!.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        Constraints.heightLeadingTrailingTop(superView: descriptionBack, view: descriptionTV!, heightAnchor: 102, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 0)
    }
    
    // LINE SEPARATOR
    func lineSeparator(top: CGFloat) {
        
        let view = UIView()
        view.backgroundColor = .lightGray
        Constraints.heightLeadingTrailingTop(superView: back!, view: view, heightAnchor: 1, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
    }
    
    // TITLE
    func title(text: String, top: CGFloat) {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Optima", size: 18)
        Constraints.leadingTopStretchableWidthHeight(superView: back!, view: label, leadingAnchor: 16, topAnchor: top, widthAnchor: 10, heightAnchor: 24)
        
    }
    
    // TOPIC
    func topic(text: String, top: CGFloat) {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        Constraints.leadingTopStretchableWidthHeight(superView: back!, view: label, leadingAnchor: 16, topAnchor: top, widthAnchor: 10, heightAnchor: 24)
    }
    
    // PICKER
    func picker() {
        
        // DISTANCE ARRAY
        let distance = Array(0...99)
        var stringDistance: [String] = []
        Observable.from(distance).map({ number in "\(number)" + " km" }).bind(onNext: { stringDistance.append($0) }).disposed(by: bag!)
        
        // PARK ABILITY
        self.parkAbilityP = Picker(superView: back!, textField: parkingTF!, array: ["", "Car", "Truck"], top: 16)
        
        // GAS STATION
        self.gasStattionP = Picker(superView: back!, textField: gasStationTF!, array: stringDistance, top: 165)
        
        var arrayInt: [String] = []
        Observable.from(distance).bind(onNext: { arrayInt.append(String($0)) }).disposed(by: bag!)
        
        // AMOUNT PICKER
        self.amountPicker = Picker(superView: back!, textField: amountTF!, array: arrayInt, top: 315)
        
        
        // BIND
        self.parkingTF!.rx.text.map({ $0 ?? "" }).bind(to: locationVM!.parking).disposed(by: bag!)
        self.nearbyTF!.rx.text.map({ $0 ?? "" }).bind(to: locationVM!.nearby).disposed(by: bag!)
        self.descriptionTV!.rx.text.map({ $0 ?? "" }).bind(to: locationVM!.description).disposed(by: bag!)
    }
    
   
    
    // SAVE BUTTON
    func save() {
        locationVM!.isValid().bind(to: saveButton!.rx.isEnabled).disposed(by: bag!)
        locationVM!.isValid().map { $0 ? 1 : 0.4 }.bind(to: saveButton!.rx.alpha).disposed(by: bag!)
        
        self.addButton = AddButton(superView: back!, button: saveButton!, top: 532, text: "Save", backColor: UIColor(red: 0.184, green: 0.352, blue: 0.215, alpha: 1), textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    // MAP ICON
    func mapIcon(top: CGFloat) {
        let mapIcon = UIButton()
        guard let image = UIImage(named: "map_icon") else { return }
        mapIcon.setImage(image, for: .normal)
        mapIcon.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: back!, view: mapIcon, widthAnchor: 27, heightAnchor: 27, trailingAnchor: -16, topAnchor: top)
    }
    
    // OPEN MAP
    @objc func openMap() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.navController.pushViewController(mapVC, animated: true)
    }
    
    // NEARBY
    func nearbyP() {
        self.nearbyPicker = Picker(superView: back!, textField: nearbyTF!, array: ["", "City", "River", "Lake", "Sea", "Ocean", "Forest"], top: 265)
    }
}
