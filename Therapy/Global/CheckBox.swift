//
//  CheckBox.swift
//  Therapy
//
//  Created by Ivan Myrza on 18/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class CheckBox {
    
    // BUTTON
    private var superView: UIView
    private var checkBox: UIButton
    private var top: CGFloat
    private let checkMark: UIImageView? = UIImageView()
    private var indicator = true
    
    // INIT
    init(superView: UIView, button: UIButton, top: CGFloat) {
        self.checkBox = button
        self.top = top
        self.superView = superView
        setup()
    }
    
    // SETUP
    private func setup() {
        guard let image = UIImage(named: "check_box") else { return }
        checkBox.setImage(image, for: .normal)
        checkBox.alpha = 0.6
        checkBox.addTarget(self, action: #selector(check), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: superView, view: checkBox, widthAnchor: 24, heightAnchor: 24, trailingAnchor: -16, topAnchor: top)
    }
    
    // CHECK MARK
    @objc private func check() {
        
        if indicator {
            guard let image = UIImage(named: "checkMark") else { return }
            checkMark?.image = image
            Constraints.widthHeightTrailingTop(superView: checkBox, view: checkMark!, widthAnchor: 15, heightAnchor: 15, trailingAnchor: -4, topAnchor: 4)
            // INDICATOR
            self.indicator = false
        } else {
            
            checkMark?.removeFromSuperview()
            self.indicator = true
        }
    }
}
