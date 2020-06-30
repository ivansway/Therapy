//
//  PasswordTextField.swift
//  Therapy
//
//  Created by Ivan Myrza on 29/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class PasswordTextField {
    
    private var superView: UIView
    private var text: String
    private var textField: UITextField
    private var top: CGFloat
    private var back: UIView? = UIView()
    private var eyeButton: UIButton? = UIButton()
    
    
    public init(superView: UIView, text: String, textField: UITextField, top: CGFloat) {
        self.superView = superView
        self.text = text
        self.textField = textField
        self.top = top
        setup()
        eyeButtonSetup()
    }
    
    private func setup() {
        
        back?.layer.borderWidth = 2
        back?.layer.cornerRadius = 18
        back?.layer.borderWidth = 0.1
        back?.layer.borderColor = UIColor(red: 0.163, green: 0.209, blue: 0.137, alpha: 1).cgColor
        Constraints.heightLeadingTrailingTop(superView: superView, view: back!, heightAnchor: 36, leadingAnchor: 20, trailingAnchor: -20, topAnchor: top)
        
        textField.placeholder = text
        textField.textAlignment = .left
        textField.font = UIFont(name: "Optima", size: 16)
        Constraints.heightLeadingTrailingTop(superView: back!, view: textField, heightAnchor: 36, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 0)
    }
    
    // EYE BUTTON SETUP
    private func eyeButtonSetup() {
        
        guard let image = UIImage(named: "eye") else {return}
        eyeButton?.setImage(image, for: .normal)
        eyeButton?.alpha = 0.15
        eyeButton?.addTarget(self, action: #selector(secrecyToggle), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: back!, view: eyeButton!, widthAnchor: 21, heightAnchor: 16, trailingAnchor: -16, topAnchor: 10)
        
        textField.isSecureTextEntry = true
    }
    
    // SECRECY TOGGLE
    @objc private func secrecyToggle() {
        if textField.isSecureTextEntry == true {
            textField.isSecureTextEntry = false
            eyeButton?.alpha = 0.7
        } else {
            textField.isSecureTextEntry = true
            eyeButton?.alpha = 0.15
        }
    }
}
