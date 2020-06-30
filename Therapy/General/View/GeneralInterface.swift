//
//  GeneralInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class GeneralInterface {
    
    // STORYBOARD
    var theBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: .main)
    
    lazy var transitionDelegate: PresentationManager? = PresentationManager(heightVC: 1.5)
    
    // NAV CONTROLLER
    internal var navController: UINavigationController
    private var scrollView: UIView
    var viewController: UIViewController
    private var superView: UIView
    private var storyCellArray: [StoryCell]? = []
    
    // INIT
    init(navController: UINavigationController, superView: UIView, scrollView: UIView, viewController: UIViewController) {
        self.navController = navController
        self.scrollView = scrollView
        self.viewController = viewController
        self.superView = superView
        self.setup()
    }
    
    // SETUP
    private func setup() {
        
        // SIGN IN BUTTON
        self.signin()
        
        // SIGN UP BUTTON
        self.signup()
        
        // ADD PLACE
        self.addPlace()
        
        // AVATAR
        self.avatar()
        
        // CHILD
        self.childImage()
        
        // FIRST PARTICIPANT
        self.participant(top: 40, text: "First Participant")
        
        // FIRST PARTICIPANT
        self.participant(top: 60, text: "Second Participant")
        
        // LOCATION
        self.location(text: "Buharest")
        
        // CHILD NAME
        self.childName(name: "GREGOR")
        
        // LINE SEPARATOR
        self.lineSeparator(top: 130, trailing: -112)
        
        // LINE SEPARATOR
        self.lineSeparator(top: 310, trailing: -16)
        
        // WISH LIST BUTTON
        self.wishListButton(title: "WISH PLACES LIST")
        
        // STORY CELLS
        self.storyCell()
    }
    
    // SIGN IN
    private func signin() {
        
        let button: UIButton? = UIButton()
        button?.setTitle("SIGN IN", for: .normal)
        button?.titleLabel?.font = UIFont(name: "Copperplate", size: 14)
        button?.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button?.addTarget(self, action: #selector(pushLoginVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: scrollView, view: button!, widthAnchor: 80, heightAnchor: 19, leadingAnchor: 16, topAnchor: 40)
    }
    
    // SIGN UP
    private func signup() {
        
        let button: UIButton? = UIButton()
        button?.setTitle("SIGN UP", for: .normal)
        button?.titleLabel?.font = UIFont(name: "Copperplate", size: 14)
        button?.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button?.addTarget(self, action: #selector(pushSignupVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: scrollView, view: button!, widthAnchor: 80, heightAnchor: 19, leadingAnchor: 16, topAnchor: 53)

    }
    
    // ADD PLACE
    private func addPlace() {
        
        let button: UIButton? = UIButton()
        button?.setTitle("ADD PLACE", for: .normal)
        button?.titleLabel?.font = UIFont(name: "Charter-Bold", size: 16)
        button?.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button?.addTarget(self, action: #selector(pushLocationsVC), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: scrollView, view: button!, widthAnchor: 100, heightAnchor: 22, leadingAnchor: 24, topAnchor: 275)
    }
    
    // AVATAR
    private func avatar() {
        let avatar: UIImageView? = UIImageView()
        avatar?.layer.cornerRadius = 15
        avatar?.backgroundColor = .lightGray
        Constraints.widthHeightTrailingTop(superView: scrollView, view: avatar!, widthAnchor: 90, heightAnchor: 90, trailingAnchor: -16, topAnchor: 40)
    }
    
    // PARTICIPANT LABEL
    private func participant(top: CGFloat, text: String) {
        let participant: UILabel? = UILabel()
        participant?.font = UIFont(name: "HelveticaNeue", size: 15)
        participant?.textAlignment = .left
        participant?.text = text
        Constraints.trailingTopStretchableWidthHeight(superView: scrollView, view: participant!, trailing: -121, top: top, width: 10, height: 19)
    }
    
    // LOCATION LABEL
    private func location(text: String) {
        let participant: UILabel? = UILabel()
        participant?.font = UIFont(name: "HelveticaNeue", size: 15)
        participant?.textAlignment = .left
        participant?.text = "Location: " + text
        Constraints.trailingTopStretchableWidthHeight(superView: scrollView, view: participant!, trailing: -24, top: 141, width: 10, height: 19)
    }
    
    // CHILD NAME
    private func childName(name: String) {
        let child: UILabel? = UILabel()
        child?.font = UIFont(name: "HelveticaNeue", size: 16)
        child?.textAlignment = .left
        child?.attributedText = NSAttributedString(string: name, attributes: [NSAttributedString.Key.kern: 4])
        Constraints.leadingTopStretchableWidthHeight(superView: scrollView, view: child!, leadingAnchor: 24, topAnchor: 142, widthAnchor: 10, heightAnchor: 19)
    }
    
    // CHILD IMAGE
    private func childImage() {
        let child: UIImageView? = UIImageView()
        child?.layer.cornerRadius = 15
        child?.backgroundColor = .lightGray
        Constraints.heightLeadingTrailingTop(superView: scrollView, view: child!, heightAnchor: 90, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 170)
    }
    
    // LINE SEPARATOR
    private func lineSeparator(top: CGFloat, trailing: CGFloat) {
        let line: UIView? = UIView()
        line?.backgroundColor = .lightGray
        Constraints.heightLeadingTrailingTop(superView: scrollView, view: line!, heightAnchor: 1, leadingAnchor: 16, trailingAnchor: trailing, topAnchor: top)
    }
    
    // WISH LIST BUTTON
    private func wishListButton(title: String) {
        let button: UIButton? = UIButton()
        button?.titleLabel?.textAlignment = .right
        button?.setTitle(title, for: .normal)
        button?.addTarget(self, action: #selector(pushWishPlaceVC), for: .touchUpInside)
        button?.setTitleColor(UIColor(red: 0.121, green: 0.3, blue: 0.1, alpha: 1), for: .normal)
        button?.titleLabel?.font = UIFont(name: "Charter-Bold", size: 16)
        Constraints.widthHeightTrailingTop(superView: scrollView, view: button!, widthAnchor: 143, heightAnchor: 22, trailingAnchor: -16, topAnchor: 275)
    }
    
    // STORY CELL
    func storyCell() {
        self.storyCellArray?.append(StoryCell(scrollView: scrollView, top: 310, superView: superView))
    }
}
