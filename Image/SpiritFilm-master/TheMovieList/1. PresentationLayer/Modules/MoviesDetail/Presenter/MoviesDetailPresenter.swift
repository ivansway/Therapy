//
//  MoviesDetailPresenter.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 29.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MoviesDetailPresenter {
    
    weak var view: MoviesDetailViewInput!
    var interactor: MoviesDetailInteractorInput!
    var router: MoviesDetailRouterInput!
    var movie: Movie!    
}

extension MoviesDetailPresenter: MoviesDetailViewOutput {
    func cancelButton() {
        router.closeCurrentModule()
    }
    
    func viewIsReady() {
        view.setupInitialState()
        interactor.loadGenre()
        interactor.loadCast(movieId: movie.id)
        interactor.loadVideo(movieId: movie.id)
    }
}

extension MoviesDetailPresenter: MoviesDetailInteractorOutput {
    func didLoadVideoSuccessfully(video: MovieVideo) {
        view.show(video: video)
        if (video.results.first?.key) != nil {
            view.showVideoPlayer()
            
        } else {
            view.hightVideoPlayer()
        }
    }
    
    func didLoadCastSuccessfully(cast: MovieCast) {
        view.show(cast: cast)
    }
    
    func didLoadGenreSuccessully(genres: [Genre]) {
        view.showMovie(movie: movie, genres: genres)
    }
}
