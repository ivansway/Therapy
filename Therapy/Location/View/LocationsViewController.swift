//
//  LocationsViewController.swift
//  Therapy
//
//  Created by Ivan Myrza on 16/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {

    var interface: LocationInterface?
    var locationVM: LocationViewModel?
    
    // SCROLL VIEW
    var scrollView: UIScrollView? = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    var resizingView: UIView? = {
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
        ScrollView.setup(view: self.view, scrollView: self.scrollView!, resizingView: self.resizingView!, resizingViewTopAnchor: 1000)
        
        // HIDE NAV BAR
        self.navigationController?.navigationBar.isHidden = true
        
        // CLOSE BUTTON
        self.close()
                
        // INTERFACE INIT
        interface = LocationInterface(superView: self.scrollView!, navController: self.navigationController ?? UINavigationController(), viewController: self)
        
        
        // ADD BUTTON
        self.interface?.addButton(superView: self.scrollView!)
        
        // ADD PLACE
        self.interface?.addPlace()
        
        // SAVE
        locationVM?.save()
    }
    
    // CLOSE BUTTON
    func close() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pop), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.scrollView!, view: button, widthAnchor: 21, heightAnchor: 21, leadingAnchor: 18, topAnchor: 20)
    }

}
