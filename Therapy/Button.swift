//
//  Button.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Button {
    
    let button: UIButton
    let superView: UIView
    let top: CGFloat
    let title: String
        
    init(button: UIButton, superView: UIView, top: CGFloat, title: String) {
        self.button = button
        self.superView = superView
        self.top = top
        self.title = title
        setup()
    }
    
    func setup() {
        
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 0.186, green: 0.146, blue: 0.044, alpha: 1)
        Constraints.heightLeadingTrailingTop(superView: superView, view: button, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
    }
}
