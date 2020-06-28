//
//  Result.swift
//  TheMovieList
//
//  Created by omar on 05/07/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

enum Result<T> {
    case succes(T)
    case error(String)
}
