//
//  VerticalImageStack.swift
//  Therapy
//
//  Created by Ivan Myrza on 29/07/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class HorizontalImageStack {
    
    private var superView: UIView
    private var overall: UIView?
    private var scrollView: UIScrollView?
    
    init(superView: UIView) {
        self.superView = superView
        setup()
    }
    
    private func setup() {
        overallSetup(top: 100)
        scrollViewSetup()
    }
    
    private func overallSetup(top: CGFloat) {
        self.overall = UIView()
        
        overall?.backgroundColor = .cyan
        overall?.layer.cornerRadius = 17
        Constraints.heightLeadingTrailingTop(superView: superView, view: overall!, heightAnchor: 100, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
    }
    
    private func scrollViewSetup() {
        
    }
    
}
