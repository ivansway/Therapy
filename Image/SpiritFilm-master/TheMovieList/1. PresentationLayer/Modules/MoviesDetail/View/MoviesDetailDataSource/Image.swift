//
//  Image.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 13.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit

@IBDesignable
class Image: UIImageView {   
    
    override func layoutSubviews() {
        let layerHeight = layer.frame.height
        let layerWidth = layer.frame.width
        let path = UIBezierPath()
        
        var points: [CGPoint] = [
            .zero,
            CGPoint(x: layerWidth, y: 0),
            CGPoint(x: layerWidth, y: layerHeight),
            CGPoint(x: 0, y: layerHeight * 0.7)
        ]
        
        path.move(to: convert(points[0], to: self))
        for point in points.dropFirst() {
            path.addLine(to: convert(point, to: self))
        }
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
   

}
