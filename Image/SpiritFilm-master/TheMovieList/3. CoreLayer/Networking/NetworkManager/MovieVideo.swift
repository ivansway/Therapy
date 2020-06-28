//
//  MovieVideo.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 10.10.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

struct MovieVideo: Codable {
    var id: Int
    var results: [Video]
}

struct Video: Codable {
    var id: String?
    var key: String?
    var name: String?
}


