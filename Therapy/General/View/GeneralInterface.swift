//
//  GeneralInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class GeneralInterface {
    
    var navController: UINavigationController!
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func loginButton(superView: UIView) {
        
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 20)
        button.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(pushLoginVC), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: superView, view: button, widthAnchor: 80, heightAnchor: 20, trailingAnchor: -16, topAnchor: 40)
    }
    
    @objc func pushLoginVC() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "MainVC") as! SignupViewController
        self.navController.navigationController?.pushViewController(loginVC, animated: true)
    }
}
