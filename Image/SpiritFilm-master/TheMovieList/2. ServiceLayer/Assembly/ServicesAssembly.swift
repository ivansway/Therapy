//
//  ServiceAssembly.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol IServicesAssembly {
    var moviesService: IMoviesService { get }
    var genreService: IGenreService { get }
    var movieCastService: IMovieCastService { get }
    var movieVideoService: IMovieVideoService { get }
}

class ServicesAssembly: IServicesAssembly {
    lazy var genreService: IGenreService = GenreService()
    lazy var moviesService: IMoviesService = MoviesService()
    lazy var movieCastService: IMovieCastService = MovieCastService()
    lazy var movieVideoService: IMovieVideoService = MovieVideoService()
}

