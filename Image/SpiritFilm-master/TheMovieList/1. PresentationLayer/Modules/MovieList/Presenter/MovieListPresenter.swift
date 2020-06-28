//
//  MovieListPresenter.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MovieListPresenter {
    weak var view: MovieListViewInput!
    var interactor: MovieListInteractorInput!
    var router: MovieListRouterInput!
}

extension MovieListPresenter: MovieListViewOutput {
    
    func viewIsReady() {
        view.setupInitialState()
        
        interactor.loadMovies(page: 1)
        interactor.loadPopularMovies(page: 1)
        interactor.loadTopRatedMovies(page: 1)
    }
    
    func buttonIsReady() {
        router.presentSearchView()
    }
    
    func didSelect(movie: Movie) {
        router.presentDetailView(movies: movie)
    }    
}

extension MovieListPresenter: MovieListInteractorOutput {
    func didLoadPopularMoviesSuccessfully(movies: [Movie]) {
        let movies = movies.filter { $0.posterPath != nil && $0.backdropPath != nil && $0.overview != nil }
        view.showPopular(movies: movies)
    }
    
    func didLoadTopRatedMoviesSuccessfully(movies: [Movie]) {
        let movies = movies.filter { $0.posterPath != nil && $0.backdropPath != nil && $0.overview != nil }
        view.showTopRaited(movies: movies)
    }
    
    func didLoadMoviesSuccessfully(movies: [Movie]) {
        let movies = movies.filter { $0.posterPath != nil && $0.backdropPath != nil && $0.overview != nil }
        view.show(movies: movies)
    }
}




