//
//  MovieListViewInput.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol MovieListInteractorInput: class {
    func loadMovies(page: Int)
    func loadTopRatedMovies(page: Int)
    func loadPopularMovies(page: Int)
}
