//
//  MovieListInteractor.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MovieListInteractor {
    weak var output: MovieListInteractorOutput!
    var moviesService: IMoviesService!    
}

extension MovieListInteractor: MovieListInteractorInput {
    func loadPopularMovies(page: Int) {
        moviesService.loadPopularMovies(page: page) { [weak self] (result: Result<[Movie]>) in
            switch result {
            case .succes(let movies):
                DispatchQueue.main.async {
                    self?.output.didLoadPopularMoviesSuccessfully(movies: movies)
                }
            case .error(let error):
                print("\(error) not data")
            }
        }
    }
    
    func loadTopRatedMovies(page: Int) {
        moviesService.loadTopRatedMovies(page: page) { [weak self] (result: Result<[Movie]>) in
            switch result {
            case .succes(let movies):
                DispatchQueue.main.async {
                    self?.output.didLoadTopRatedMoviesSuccessfully(movies: movies)
                }
            case .error(let error):
                print("\(error) not data")
            }
        }
        
    }
    
    func loadMovies(page: Int) {
        moviesService.loadMovies(page: page) { [weak self] (result: Result<[Movie]>) in
            switch result {
            case .succes(let movies):
                DispatchQueue.main.async {
                    self?.output.didLoadMoviesSuccessfully(movies: movies)
                }
            case .error(let error):
                print("\(error) not data")
            }
        }
    }
}
