//
//  ScrollView.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation
import UIKit

class ScrollView {
    
    class func setup(view: UIView, scrollView: UIScrollView, resizingView: UIView, resizingViewTopAnchor: CGFloat) {
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(resizingView)
        resizingView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.frame.width).isActive = true
        resizingView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: resizingViewTopAnchor).isActive = true
        resizingView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        resizingView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
    }
}
