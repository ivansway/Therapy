//
//  Genre.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 10.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

struct Genre: Codable {
    var id: Int?
    var name: String?
}

struct GenreResponse<T: Codable>: Codable {
    var genres: [Genre]
}
