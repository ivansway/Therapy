//
//  GeneralTransition.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

extension GeneralInterface {
    
    // PUSH LOGIN VC
    @objc func pushLoginVC() {
        
        let loginVC = self.theBoard?.instantiateViewController(withIdentifier: "SiginViewController") as! SigninViewController
        loginVC.modalPresentationStyle = .custom
        loginVC.transitioningDelegate = transitionDelegate
        self.viewController.present(loginVC, animated: true)
    }
    
    // PUSH SIGNUP VC
    @objc func pushSignupVC() {
        
        let signinVC = self.theBoard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navController.pushViewController(signinVC, animated: true)
    }
    

    // PUSH LOCATION VC
    @objc func pushLocationsVC() {
        
        let locationsVC = self.theBoard?.instantiateViewController(withIdentifier: "LocationsViewController") as! LocationsViewController
        self.navController.pushViewController(locationsVC, animated: true)
    }
    
    // PUSH WISH PLACE VC
    @objc func pushWishPlaceVC() {
        let wishPlaceVC = self.theBoard?.instantiateViewController(withIdentifier: "WishPlaceViewController") as! WishPlaceViewController
        self.navController.pushViewController(wishPlaceVC, animated: true)
    }
}

