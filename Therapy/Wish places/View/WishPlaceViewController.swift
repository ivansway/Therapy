//
//  WishPlaceViewController.swift
//  Therapy
//
//  Created by Ivan Myrza on 27/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class WishPlaceViewController: UIViewController {
    
    // SCROLL VIEW
    let scrollView: UIScrollView? = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // RESIZING VIEW
    let resizingView: UIView? = {
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
        
        // CLOSE BUTTON
        self.closeButton()

    }
    
    // CLOSE BUTTON
    func closeButton() {
        let button = UIButton()
        guard let image = UIImage(named: "X_close") else { return }
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: self.scrollView!, view: button, widthAnchor: 21, heightAnchor: 21, leadingAnchor: 18, topAnchor: 20)
    }
}
