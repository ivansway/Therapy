//
//  Constraints.swift
//  Therapy
//
//  Created by Ivan Myrza on 13/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class Constraints {
        
    class func widthHeightLeadingTop(superView: UIView, view: UIView, widthAnchor: CGFloat, heightAnchor: CGFloat, leadingAnchor: CGFloat, topAnchor: CGFloat) {
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor).isActive = true
    }
    
    class func widthHeightTrailingTop(superView: UIView, view: UIView, widthAnchor: CGFloat, heightAnchor: CGFloat, trailingAnchor: CGFloat, topAnchor: CGFloat) {
        
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor).isActive = true
    }
    
    class func heightLeadingTrailingTop(superView: UIView, view: UIView, heightAnchor: CGFloat, leadingAnchor: CGFloat, trailingAnchor: CGFloat, topAnchor: CGFloat) {
       
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor).isActive = true
    }
    
    class func leadingTopStretchableWidthHeight(superView: UIView, view: UIView, leadingAnchor: CGFloat, topAnchor: CGFloat, widthAnchor: CGFloat, heightAnchor: CGFloat) {
    
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor).isActive = true
        view.widthAnchor.constraint(greaterThanOrEqualToConstant: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
    }
    
    class func trailingTopStretchableWidthHeight(superView: UIView, view: UIView, trailing: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) {
    
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing).isActive = true
        view.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        view.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
