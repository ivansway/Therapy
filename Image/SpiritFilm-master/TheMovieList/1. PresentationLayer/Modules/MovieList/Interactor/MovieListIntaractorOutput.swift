//
//  MovieListIntaractorOutput.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MovieListInteractorOutput: class {
    func didLoadMoviesSuccessfully(movies: [Movie])
    func didLoadPopularMoviesSuccessfully(movies: [Movie])
    func didLoadTopRatedMoviesSuccessfully(movies: [Movie])
}
