//
//  Cust.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 16.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

struct MovieCast: Codable {
    var id: Int?
    var cast: [Cast]
    var crew: [Crew]
}

struct Cast: Codable {
    var castId: Int
    var id: Int
    var name: String?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case castId = "cast_id"
        case id
        case name
        case profilePath = "profile_path"
    }
}

struct Crew: Codable {
    var department: String
    var id: Int
    var job: String
    var name: String?
}

struct MovieCastResponse<T: Codable>: Codable {
    var movieCast: [MovieCast]
}
