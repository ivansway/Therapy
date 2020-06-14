//
//  TextField.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class TextField {
    
    let superView: UIView
    let text: String
    let textField: UITextField
    let top: CGFloat
    let back = UIView()
    
    init(superView: UIView, text: String, textField: UITextField, top: CGFloat) {
        self.superView = superView
        self.text = text
        self.textField = textField
        self.top = top
        setup()
    }
    
    func setup() {
        
        back.layer.borderWidth = 2
        back.layer.cornerRadius = 15
        back.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        Constraints.heightLeadingTrailingTop(superView: superView, view: back, heightAnchor: 46, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        textField.placeholder = text
        textField.textAlignment = .left
        textField.font = UIFont(name: "Copperplate", size: 20)
        Constraints.heightLeadingTrailingTop(superView: back, view: textField, heightAnchor: 46, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 0)
    }
}
