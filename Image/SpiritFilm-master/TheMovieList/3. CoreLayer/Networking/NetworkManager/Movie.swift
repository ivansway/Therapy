//
//  MovieList.swift
//  TheMovieList
//
//  Created by omar on 04/07/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var voteAverage: Double?
    var title: String?
    var posterPath: String?
    var overview: String?
    var releaseDate: String?
    var backdropPath: String?
    var genreIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case voteAverage = "vote_average"
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"        
        case genreIds = "genre_ids"
    }
}

struct Response<T: Codable>: Codable {
    var page: Int
    var results: T
}
