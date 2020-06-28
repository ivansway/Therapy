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
    var superView: UIView
    var navController: UINavigationController
    var viewController: UIViewController

    // INIT
    init(superView: UIView, navController: UINavigationController, viewController: UIViewController) {
        self.superView = superView
        self.navController = navController
        self.viewController = viewController
    }

    // ADD PLACE
    func addPlace() {
        let waterSwitch: UISwitch? = UISwitch()
        let electroSwitch: UISwitch? = UISwitch()
        self.place = Place(superView: superView, top: 80, waterSwitch: waterSwitch!, electroSwitch: electroSwitch!, navController: navController, viewController: self.viewController)
    }

    // ADD BUTTON
    func addButton(superView: UIView) {

        let button = UIButton()
        guard let image = UIImage(named: "AddButton") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addPhotot), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: superView, view: button, widthAnchor: 34, heightAnchor: 34, trailingAnchor: -16, topAnchor: 13)



    }

    // ADD PHOTO
    @objc func addPhotot() {
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let photoVC = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
//        viewController.present(photoVC, animated: true)
    }

}
