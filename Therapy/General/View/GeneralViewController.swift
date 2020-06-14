//
//  GeneralViewController.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    // INSTANCE
    var interface: GeneralInterface!
    lazy var transitionDelegate = PresentationManager(heightVC: 1.5)
    
    // SCROLL VIEW
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    let resizingView: UIView = {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        return testView
    }()
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settings()
    }
    
    // SETTINGS
    func settings() {
        
        // BACK COLOR
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.981, blue: 0.900, alpha: 1)
        
        // SCROLL VIEW
        ScrollView.setup(view: self.view, scrollView: self.scrollView, resizingView: self.resizingView, resizingViewTopAnchor: 1000)
        
        // HIDE NAV BAR 
        self.navigationController?.navigationBar.isHidden = true
        
        self.interface = GeneralInterface(navController: self.navigationController ?? UINavigationController())
        
        // SIGN IN BUTTON
        self.signin()
        
        // SIGN UP BUTTON
        self.signup()
    }
    
    // SIGN IN
    func signin() {
        
        let button = UIButton()
        button.setTitle("sign in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 20)
        button.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(pushLoginVC), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: self.scrollView, view: button, widthAnchor: 80, heightAnchor: 20, trailingAnchor: -16, topAnchor: 40)
    }
    
    // SIGN UP
    func signup() {
        
        let button = UIButton()
        button.setTitle("sign up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 20)
        button.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(pushSignupVC), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: self.scrollView, view: button, widthAnchor: 80, heightAnchor: 20, trailingAnchor: -16, topAnchor: 65)
    }
}
