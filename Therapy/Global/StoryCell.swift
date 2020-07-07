//
//  StoryCell.swift
//  Therapy
//
//  Created by Ivan Myrza on 27/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class StoryCell {
    
    private var text = "Text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text"
    
    private var overall: UIView? = UIView()
    private var scrollView: UIView
    private var superView: UIView
    private var top: CGFloat
    
    public init(scrollView: UIView, top: CGFloat, superView: UIView) {
        self.scrollView = scrollView
        self.superView = superView
        self.top = top
        self.setup()
    }
    
    private func setup() {
        
        // BACK
        overall?.layer.cornerRadius = 15
        overall?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        Constraints.heightLeadingTrailingTop(superView: scrollView, view: overall!, heightAnchor: 400, leadingAnchor: 16, trailingAnchor: -16, topAnchor: top)
        
        // DESCRIPTION
        self.description(text: text)
        
        // PARKING ABILITY
        self.leadingLabel(title: "Parking ability", top: 16, value: "car")
        
        // ELECTRICITY
        self.leadingLabel(title: "Electricity", top: 40, value: "yes")
        
        // LOCATION
        self.leadingLabel(title: "Location", top: 69, value: "")
        
        // NEARBY
        self.leadingLabel(title: "Nearby", top: 93, value: "river")
        
        // WATER
        self.trailingLabel(title: "Water", top: 16, value: "yes")
        
        // GAS STATION
        self.trailingLabel(title: "Gas station", top: 40, value: "23 km")
        
        // AMOUNT
        self.trailingLabel(title: "Amount", top: 93, value: "3")
        
        // MAP ICON
        self.rightMapIcon(top: 64)
        
        // ITS LOCATION LABEL
        self.itsLocationLabel()
        
        // MAP ICON
        self.leftMapIcon(top: 64)
    }
        
    // MARK: DESCRIPTION
    private func description(text: String) {
        
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "HelveticaNeue", size: 15)
        label?.text = text
        label?.numberOfLines = 0

        self.overall?.addSubview(label!)
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        label?.leadingAnchor.constraint(equalTo: self.overall!.leadingAnchor, constant: 16).isActive = true
        label?.topAnchor.constraint(equalTo: self.overall!.topAnchor, constant: 150).isActive = true
        label?.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: -64).isActive = true
    }
    
    // MARK: LEADING LABEL
    private func leadingLabel(title: String, top: CGFloat, value: String) {
        
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "HelveticaNeue", size: 16)
        label?.text = title + ": " + value
        Constraints.leadingTopStretchableWidthHeight(superView: overall!, view: label!, leadingAnchor: 16, topAnchor: top, widthAnchor: 10, heightAnchor: 19)
    }
    
    // MARK: TRAILING LABEL
    private func trailingLabel(title: String, top: CGFloat, value: String) {
       
        let label: UILabel? = UILabel()
        label?.font = UIFont(name: "HelveticaNeue", size: 16)
        label?.text = title + ": " + value
        Constraints.trailingTopStretchableWidthHeight(superView: overall!, view: label!, trailing: -16, top: top, width: 10, height: 19)
    }
    
    // MARK: MAP ICON
    private func rightMapIcon(top: CGFloat) {
        let mapIcon = UIButton()
        guard let image = UIImage(named: "map_icon") else { return }
        mapIcon.setImage(image, for: .normal)
//        mapIcon.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        Constraints.widthHeightTrailingTop(superView: overall!, view: mapIcon, widthAnchor: 23, heightAnchor: 23, trailingAnchor: -16, topAnchor: top)
    }
    
    // MARK: MAP ICON
    private func leftMapIcon(top: CGFloat) {
        let mapIcon = UIButton()
        guard let image = UIImage(named: "map_icon") else { return }
        mapIcon.setImage(image, for: .normal)
    //        mapIcon.addTarget(self, action: #selector(openMap), for: .touchUpInside)
        Constraints.widthHeightLeadingTop(superView: overall!, view: mapIcon, widthAnchor: 23, heightAnchor: 23, leadingAnchor: 88, topAnchor: top)
    }
    
    // MARK: ITS LOCATION LABEL
    private func itsLocationLabel() {
        
        let label: UILabel? = UILabel()
        label?.text = "It's location: "
        label?.font = UIFont(name: "HelveticaNeue", size: 16)
        label?.textAlignment = .left
        Constraints.widthHeightTrailingTop(superView: overall!, view: label!, widthAnchor: 88, heightAnchor: 19, trailingAnchor: -45, topAnchor: 69)
    }
    
    
}
