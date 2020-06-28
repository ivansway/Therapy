//
//  Assembly.swift
//  TheMovieList
//
//  Created by omar on 05/07/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol ICoreAssembly {
    var networkManager: InetworkManager { get }
}

class CoreAssembly: ICoreAssembly {
    lazy var networkManager: InetworkManager = NetworkManager()
    
}
