//
//  MoviesDetailInteractor.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MoviesDetailInteractor {
    weak var output: MoviesDetailInteractorOutput!
    var genreService: IGenreService!
    var movieCastService: IMovieCastService!
    var movieVideoService: IMovieVideoService!
}

extension MoviesDetailInteractor: MoviesDetailInteractorInput {
    func loadVideo(movieId: Int) {        
        movieVideoService.loadMovieVideo(movieId: movieId) { [weak self] (result: Result<MovieVideo>) in
            switch result {
            case .succes(let video):
                DispatchQueue.main.async {
                    self?.output.didLoadVideoSuccessfully(video: video)
                }
            case .error(let error):
                print("\(error) no data")
            }
        }
    }
    
    func loadCast(movieId: Int) {
        movieCastService.loadMovieCast(movieId: movieId) { [weak self] (result: Result<MovieCast>) in
            switch result {
            case .succes(let cast):
                DispatchQueue.main.async {                    
                    self?.output.didLoadCastSuccessfully(cast: cast)
                }
            case .error(let error):
                print("\(error) no data")
            }
        }
    }
    
    func loadGenre() {
        genreService.loadGenre { [weak self] (result: Result<[Genre]>) in
            switch result {
            case .succes(let genres):
                DispatchQueue.main.async {
                    self?.output.didLoadGenreSuccessully(genres: genres)
                }
            case .error(let error):
                print("\(error) no data")
            }
        }
    }
}
