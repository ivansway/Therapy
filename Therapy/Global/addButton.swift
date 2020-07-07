//
//  addButton.swift
//  Therapy
//
//  Created by Ivan Myrza on 17/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class AddButton {
    
    private var superView: UIView
    private var button: UIButton
    private var top: CGFloat
    private var text: String
    private var backColor: UIColor
    private var textColor: UIColor
    
    // INIT
    public init(superView: UIView, button: UIButton, top: CGFloat,
         text: String, backColor: UIColor, textColor: UIColor) {
        
        self.superView = superView
        self.button = button
        self.top = top
        self.text = text
        self.backColor = backColor
        self.textColor = textColor
        self.setup()
    }
    
   
    // SETUP
    private func setup() {
        button.backgroundColor = backColor
        button.setTitleColor(textColor, for: .normal)
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 25
        Constraints.heightLeadingTrailingTop(superView: superView, view: button, heightAnchor: 48, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
    }
}
