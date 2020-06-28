//
//  MapNetworkDelegate.swift
//  Therapy
//
//  Created by Ivan Myrza on 23/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation

protocol MapNetworkDelegate: class {
    func passJsonBase(value: JsonBase)
}

protocol PlaceDetailDelegate: class {
    func passPlaceDetail(value: PlaceDetail?)
}
