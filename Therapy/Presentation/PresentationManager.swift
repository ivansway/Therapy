//
//  PresentationManager.swift
//  Therapy
//
//  Created by Ivan Myrza on 14/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class PresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    
    private var heightVC: CGFloat!
    
    init(heightVC: CGFloat) {
        self.heightVC = heightVC
    }
    
    enum PresentationDirection {
        case left
        case top
        case right
        case bottom
    }
    
    var direction: PresentationDirection? = .left
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentationController = PresentationController(presentedViewController: presented, presenting: presenting, direction: self, heightVC: heightVC)
      return presentationController
    }
}
