//
//  GeneralTransition.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

extension GeneralViewController {
    
    // PUSH LOGIN VC
    @objc func pushLoginVC() {
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "SiginViewController") as! SiginViewController
       
        loginVC.modalPresentationStyle = .custom
        loginVC.transitioningDelegate = transitionDelegate
        
        self.present(loginVC, animated: true)
        
        
    }
    
    // PUSH SIGNUP VC
    @objc func pushSignupVC() {
        
        let signinVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        
        self.navigationController?.pushViewController(signinVC, animated: true)
    }

}
